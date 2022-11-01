class CreateMpWebhooks < ActiveRecord::Migration[7.0]
  def change
    create_table :mp_webhooks do |t|

      t.timestamps
    end
  end
end
