class User < ApplicationRecord
  validate :password_regex, on: :create
  validate :expiration_date_future

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
    return if password =~ /\A(?=.*[a-z])(?=.*[A-Z]).{5,}\z/ 
      errors.add :password,'Debe tener entre 6 y 20 caracteres incluyendo una letra minúscula y una letra mayúscula'
  end

  def expiration_date_future
    return if vencimiento_licencia.future?
      errors.add :vencimiento_licencia,'La fecha de vencimiento debe ser una fecha futura'
  end

end