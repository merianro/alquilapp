class MpWebhook < ApplicationRecord
  validates_uniqueness_of :id_pago
end
