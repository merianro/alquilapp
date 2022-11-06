class AddAccreditedToMpWebhook < ActiveRecord::Migration[7.0]
  def change
    add_column :mp_webhooks, :accredited, :boolean
  end
end
