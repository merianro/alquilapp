class MpWebhooksController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  require 'json'
  require 'net/http'

  # GET /mp_webhooks or /mp_webhooks.json
  def index
    @mp_webhooks = MpWebhook.all
  end

  # GET /mp_webhooks/1 or /mp_webhooks/1.json
  def show
  end

  def new
    @wh = MpWebhook.new
  end

  def create
    data_json = JSON.parse request.body.read

    @idPago = data_json['data']['id']
    # capturo el id del pago -- basicamente cuando alguien pague llegará un webhook con un id

    @wh = MpWebhook.new(id_pago: @idPago, accredited: false)
    @wh.save

    aux = 'https://api.mercadopago.com/v1/payments/'+ @idPago
    uri = URI(aux)
    req = Net::HTTP::Get.new(uri)
    req['Authorization'] = 'Bearer APP_USR-1810282633093795-102310-24df0f40240b34b3a7444cf598319bb8-1223417679'

    req_options = {
      use_ssl: uri.scheme == "https"
    }
    res = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(req) 
    end

    aux2 = res.body.inspect
    data_json = JSON.parse res.body
    # si detecta en el json que esta aprobado el pago
    idUsuario = ""
    saldo = 0.0
    


    if ((aux2["approved"]) &&  (MpWebhook.where(id_pago: @idPago).first.accredited == false)) then
      MpWebhook.where(id_pago: @idPago).first.update(accredited: true)
      idUsuario = data_json['metadata']['one']  
      saldo = data_json['transaction_amount']
      puts(idUsuario)
      puts(saldo)
      UsersController.new.anadir_saldo(idUsuario,saldo)
      redirect_to controller: :users, action: :anadir_saldo, saldo: saldo, id: idUsuario and return
    end
    return
  end



end
