class SistemaReporte < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  enum severidad: [:leve, :moderado, :grave]

end
