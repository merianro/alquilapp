class SistemaReporte < ApplicationRecord
  has_many_attached :images
  validates :images, presence: false, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..(5.megabytes) }
  belongs_to :user
  enum severidad: [:Leve, :Moderado, :Grave]
  belongs_to :message, optional: true
  belongs_to :alquiler
end
