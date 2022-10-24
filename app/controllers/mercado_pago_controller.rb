class MercadoPagoController < ApplicationController
  require 'mercadopago'

  def index
    # Agrega credenciales
    sdk = Mercadopago::SDK.new('TEST-1810282633093795-102310-02882837de0537bcdc7771e9ad686b10-1223417679')
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
    
  ]
  }
  preference_response = sdk.preference.create(preference_data)
  preference = preference_response[:response]

  # Este valor reemplazará el string "<%= @preference_id %>" en tu HTML
  @preference_id = preference['id']
  end
end

