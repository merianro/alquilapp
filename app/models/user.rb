class User < ApplicationRecord
  enum role: [:driver, :su, :admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   # Al crearse el usuario se setea con rango usuario automaticamente.
  has_many :cars
  has_one :validation, dependent: :destroy
  validates_uniqueness_of :dni


end