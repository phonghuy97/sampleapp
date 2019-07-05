class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: Settings.maxName}
  validates :email,presence: true, length: {maximum: Settings.maxMail},
                   format: {with: Settings.VALID_EMAIL_REGEX}
  validates :password, presence: true, length: {minimum: Settings.minPass}
  has_secure_password
end
