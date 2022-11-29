class Validation < ApplicationRecord
  has_one_attached :licencia
  has_one_attached :dni
  belongs_to :user
  validates_uniqueness_of :user_id
  validates :licencia, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..(5.megabytes) }
  validates :dni, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..(5.megabytes) }

    def procesar
        licencia.variant.rezise_to_limit[10,10].processed
    end


end