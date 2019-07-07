class User < ApplicationRecord
  before_save {email.downcase!}
  validates :name, presence: true, length: {maximum: Settings.maxName}
  validates :email,presence: true, length: {maximum: Settings.maxMail},
    format: {with: Settings.VALID_EMAIL_REGEX}
  validates :password, presence: true, length: {minimum: Settings.minPass}

  has_secure_password
  
  def digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
  BCrypt::Engine.cost
    BCrypt::Password.create string, cost: cost
  end
end
