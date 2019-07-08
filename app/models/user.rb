class User < ApplicationRecord
  attr_accessor :remember_token
  before_save {email.downcase!}
  validates :name, presence: true, length: {maximum: Settings.maxName}
  validates :email,presence: true, length: {maximum: Settings.maxMail},
    format: {with: Settings.VALID_EMAIL_REGEX},
    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: {minimum: Settings.minPass}

  has_secure_password

  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
        BCrypt::Password.create string, cost: cost
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    remember = User.new_token
    update :remember_digest, User.digest remember_token
  end

  def forget
    update remember_digest: nil
  end

  def authenticated? remember_token
    BCrypt::Password.new remember_digest.is_password? remember_token
  end
end
