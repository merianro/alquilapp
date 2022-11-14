class User < ApplicationRecord
  validate :password_regex
  enum role: [:driver, :su, :admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Al crearse el usuario se setea con rango usuario automaticamente.
  has_many :cars
  has_one :validation, dependent: :destroy
  validates_uniqueness_of :dni, scope: %i[role ] 
  # chequea si hay un solo dni por rol


  private
  def password_regex
    return if password.blank? || password =~ /\A(?=.*[a-z])(?=.*[A-Z]).{5,}\z/ || password == email
      errors.add :password,'La contraseña debe ser diferente al email y debe tener entre 6 y 20 caracteres incluyendo una letra minúscula y una letra mayúscula'
  end

end