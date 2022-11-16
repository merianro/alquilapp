class Validation < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  validates_uniqueness_of :user_id
  validates :images, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..(5.megabytes) }
  validate :rip_bool 
  validate :number_images

    def procesar
        image.variant.rezise_to_limit[10,10].processed
    end


private
def rip_bool
    return if (images.count == 1)
      errors.add(:images, 'Debes subir la imagen del DNI y la Licencia')
end
  def number_images
    return if (images.count <= 2)
        errors.add(:images, 'Solo podes subir un maximo de 2 imagenes') 
  end 


end