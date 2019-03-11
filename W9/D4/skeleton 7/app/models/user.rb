class User < ApplicationRecord

  validates :user_name, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  
  after_initialize :reset_session_token!
  before_validation :ensure_session_token

  def self.find_by_credentials(username, password)
    user = User.find_by(user_name: username)
    return user if user && user.is_password?(password)
  end

  attr_reader :password

  def reset_session_token!
    self.session_token = self.class.generate_session_token 
    self.save!
    self.session_token
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

end