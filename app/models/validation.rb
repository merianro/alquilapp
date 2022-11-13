class Validation < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    validates_uniqueness_of :user_id
    validates :image, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..(5.megabytes) }
   
    def procesar
        image.variant.rezise_to_limit[10,10].processed
    end

  private


end
