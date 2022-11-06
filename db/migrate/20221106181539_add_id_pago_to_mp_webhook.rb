class AddIdPagoToMpWebhook < ActiveRecord::Migration[7.0]
  def change
    add_column :mp_webhooks, :id_pago, :string
  end
end
