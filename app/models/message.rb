class Message < ApplicationRecord
    has_many_attached :images
    validates :images, presence: false, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..(5.megabytes) }
    has_one :sistema_reporte
end
