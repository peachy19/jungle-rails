class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }, allow_nil: true

    def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
      if user && user.authenticate(password)
        user
    end
  end

end
