class Validation < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    validates_uniqueness_of :user_id
end
