class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 4 }

  def self.authenticate_with_credentials(email, password)
    #take in email to be able to authenticate them, use this to find the user by email in the system
    email = email.strip.downcase
    user = User.find_by_email(email)
    #return instance of user if it passes or nil otherwise
    if user && user.authenticate(password)
      #returns the user
      @user = user
    else
      nil
    end
  end

  
end
