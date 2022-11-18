class Car < ApplicationRecord
    has_many :users
    has_one_attached :image
    validates_uniqueness_of :patente
end
