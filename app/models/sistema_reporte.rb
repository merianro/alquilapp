class SistemaReporte < ApplicationRecord
  has_many_attached :images
  validates :images, presence: false, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..(5.megabytes) }
  belongs_to :user
  enum severidad: [:leve, :moderado, :grave]


end
