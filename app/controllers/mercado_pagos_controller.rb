class MercadoPagosController < ApplicationController
  require 'mercadopago'

  def index
    # Agrega credenciales ACCESS TOKEN
    sdk = Mercadopago::SDK.new('APP_USR-1810282633093795-102310-24df0f40240b34b3a7444cf598319bb8-1223417679')
    # Crea un objeto de preferencia
    preference_data = {
      items: [
        {
          id: 'PR0001',
          title: 'Mi producto',
          description: 'Inspired by the classic foldable art of origami',
          quantity: 3,
          currency_id: 'ARS',
          unit_price: 55.00
        }
      ],  
      metadata:{
        one: current_user.id
        # envio el id del usuario que esta recargando el saldo
      },
      back_urls: {
            success: "https://www.success.com",
            failure: "http://www.failure.com",
            pending: "http://www.pending.com"
        }   
  }
  preference_response = sdk.preference.create(preference_data)
  preference = preference_response[:response]

  # Este valor reemplazará el string "<%= @preference_id %>" en tu HTML
  @preference_id = preference['id']
  end




end

