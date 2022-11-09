class Car < ApplicationRecord
    has_many :users
    validates_uniqueness_of :patente
end
