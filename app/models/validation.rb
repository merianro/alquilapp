class Validation < ApplicationRecord
    has_one_attached :image
    validate :correct_document_mime_type
    belongs_to :user
    validates_uniqueness_of :user_id

    def procesar
        image.variant.rezise_to_limit[10,10].processed
    end

  private

 def correct_document_mime_type
   if image.attached? && !(image.image?)  
     image.purge # delete the uploaded file
     errors.add(:image, 'El archivo debe ser una imagen')
   end
 end
end
