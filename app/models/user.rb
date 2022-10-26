class User < ApplicationRecord
  enum role: [:user, :su, :admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   # Al crearse el usuario se setea con rango usuario automaticamente.
     
end
