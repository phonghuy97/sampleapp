class Micropost < ApplicationRecord
  belongs_to :user
  delegate :name, to: :user
  scope :created, -> {order(created_at: :desc)}
  scope :userid, -> {where "user_id = ?", id}
  mount_uploader :picture, PictureUploader

  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: Settings.maxContentMicroPost}
  validate  :picture_size

  def picture_size
    return if picture.size < Settings.pictute_size.megabytes
    errors.add :picture, t("model.micropost.picture_size")
  end
end
