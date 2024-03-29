class MercadoPagosController < ApplicationController
  before_action :authenticate_user!
  require 'mercadopago'

  def index
    # Agrega credenciales ACCESS TOKEN
    sdk = Mercadopago::SDK.new('APP_USR-2805752703700726-110908-7eb68cf1eb5a54dae828f0742764a1a4-1235201130')
    # Crea un objeto de preferencia
    preference_data = {
      items: [
        {
          id: 'PR0001',
          title: '$100 Alquilapp',
          description: '$100 Alquilapp',
          quantity: 1,
          currency_id: 'ARS',
          unit_price: 100.00
        }
      ],  
      metadata:{
        one: current_user.id
        # envio el id del usuario que esta recargando el saldo
      },
      back_urls: {
            success: "https://331f-191-84-232-112.sa.ngrok.io/mercado_pagos",
            failure: "https://331f-191-84-232-112.sa.ngrok.io/mercado_pagos",
            pending: "https://331f-191-84-232-112.sa.ngrok.io/mercado_pagos"
        }   
      }

    preference_data2 = {
      items: [
        {
          id: 'PR0002',
          title: '$500 Alquilapp',
          description: '$500 Alquilapp',
          quantity: 1,
          currency_id: 'ARS',
          unit_price: 500.00
        }
      ],  
      metadata:{
        one: current_user.id
        # envio el id del usuario que esta recargando el saldo
      },
      back_urls: {
        success: "https://331f-191-84-232-112.sa.ngrok.io/mercado_pagos",
        failure: "https://331f-191-84-232-112.sa.ngrok.io/mercado_pagos",
        pending: "https://331f-191-84-232-112.sa.ngrok.io/mercado_pagos"
        }   
      } 

    preference_data3 = {
      items: [
        {
          id: 'PR0002',
          title: '$1000 Alquilapp',
          description: '$1000 Alquilapp',
          quantity: 1,
          currency_id: 'ARS',
          unit_price: 1000.00
        }
      ],  
      metadata:{
        one: current_user.id
        # envio el id del usuario que esta recargando el saldo
      },
      back_urls: {
        success: "https://331f-191-84-232-112.sa.ngrok.io/mercado_pagos",
        failure: "https://331f-191-84-232-112.sa.ngrok.io/mercado_pagos",
        pending: "https://331f-191-84-232-112.sa.ngrok.io/mercado_pagos"
        }   
      } 

    preference_data4 = {
        items: [
          {
            id: 'PR0002',
            title: '$5000 Alquilapp',
            description: '$5000 Alquilapp',
            quantity: 1,
            currency_id: 'ARS',
            unit_price: 5000.00
          }
        ],  
        metadata:{
          one: current_user.id
          # envio el id del usuario que esta recargando el saldo
        },
        back_urls: {
          success: "https://331f-191-84-232-112.sa.ngrok.io/mercado_pagos",
          failure: "https://331f-191-84-232-112.sa.ngrok.io/mercado_pagos",
          pending: "https://331f-191-84-232-112.sa.ngrok.io/mercado_pagos"
          }   
      } 

  preference_response = sdk.preference.create(preference_data)
  preference = preference_response[:response]

  preference_response2 = sdk.preference.create(preference_data2)
  preference2 = preference_response2[:response]

  preference_response3 = sdk.preference.create(preference_data3)
  preference3 = preference_response3[:response]

  preference_response4 = sdk.preference.create(preference_data4)
  preference4 = preference_response4[:response]

  # Este valor reemplazará el string "<%= @preference_id %>" en tu HTML
  @preference_id = preference['id']
  @preference_id2 = preference2['id']
  @preference_id3 = preference3['id']
  @preference_id4 = preference4['id']

  end



end

