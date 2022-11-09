class Validation < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    validates_uniqueness_of :user_id

    def procesar
        image.variant.rezise_to_limit[10,10].processed
    end
end
