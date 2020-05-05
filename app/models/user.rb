class User < ActiveRecord::Base

  has_secure_password

  validates :password, length: { minimum: 6 }
  validates :email, uniqueness: { case_sensitive: false } 

  def self.authenticate_with_credentials(email, password)
    user = where('LOWER(email) = ?', email.downcase.delete(' '))[0]
    user && user.authenticate(password)
  end
end
