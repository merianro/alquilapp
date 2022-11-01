class ValidarMp 

  require 'net/http'
  require 'json'

  def initialize(id)
    @id = id
  end

  def pagoAprobado
    aux = 'https://api.mercadopago.com/v1/payments/'+ @id
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

    # si detecta en el json que esta aprobado el pago
    if aux2["approved"] 
      true
    else
     false
    end
  end

  def idUsuarioRecargar
    aux = 'https://api.mercadopago.com/v1/payments/'+ @id
    uri = URI(aux)
    req = Net::HTTP::Get.new(uri)
    req['Authorization'] = 'Bearer APP_USR-1810282633093795-102310-24df0f40240b34b3a7444cf598319bb8-1223417679'

    req_options = {
      use_ssl: uri.scheme == "https"
    }
    res = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(req) 
    end

    data_json = JSON.parse res.body

    idUsuario = data_json['metadata']['one']
    monto = data_json['transaction_amount']
     
    return idUsuario, monto

  end

end
