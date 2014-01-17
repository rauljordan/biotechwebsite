class User < ActiveRecord::Base
  include BCrypt
  attr_accessor :password
 
  before_save :encrypt_password


  validates_confirmation_of :password , :message => "Las contraseñas no son iguales"
  validates_presence_of :password, :message => "Tiene que ingresar una contraseña"
  validates_presence_of :email,:message=>"Email es requerido"
  validates_uniqueness_of :email,:message => "Este email ya está registrado"
  validates_presence_of :first_name , :message => "Primer Nombre no puede estar en blanco"
  validates_presence_of :last_name, :message => "Apellido no puede estar en blanco"

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
