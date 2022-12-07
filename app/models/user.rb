class User < ApplicationRecord
  validate :password_regex_1,  on: [:create]
  validate :password_regex_2,  on: [:create]

  validate :expiration_date_future#, unless: [:create_su]
  validate :dieciocho
  enum role: [:driver, :su, :admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Al crearse el usuario se setea con rango usuario automaticamente.
  has_many :cars
  has_one :validation, dependent: :destroy
  validates_uniqueness_of :dni
  # chequea si hay un solo dni por rol
  has_many :alquilers

  def soft_delete
    update_attribute(:deleted_at, Time.current) 
    update_attribute(:name, nil)
    update_attribute(:surname, nil)
    update_attribute(:dni, nil)
    update_attribute(:phone, 0)
  end

  def active_for_authentication?
    super && !deleted_at
  end
  


  private
  def password_regex_1
    return if password =~ /\A(?=.*[a-z]).{5,}\z/ 
      errors.add :password,'Debe tener una letra minúscula'
  end

  def password_regex_2
    return if password =~ /\A(?=.*[A-Z]).{5,}\z/ 
      errors.add :password,'Debe tener una letra mayúscula'
  end

  def expiration_date_future
    return if vencimiento_licencia.future?
      errors.add :vencimiento_licencia,'La fecha de vencimiento debe ser una fecha futura'
  end

  def dieciocho
    return if ((Date.today - birthdate) / 365).to_f >= 18
      errors.add :birthdate,'Debes ser mayor de 18 años'
  end

end