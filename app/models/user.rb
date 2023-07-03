class User < ActiveRecord::Base

  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email.strip.downcase)
    if user && user.authenticate(password)
        return user
    else
        return nil
    end
  end

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: 8 }

  validates :password_confirmation, presence: true, if: :password_required?

  private

  def password_required?
    password.present?
  end

end
