class Car < ApplicationRecord
    has_many :users
    has_many_attached :images
    validates_uniqueness_of :patente
end
