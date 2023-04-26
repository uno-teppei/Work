class Post < ApplicationRecord

  belongs_to :user

  mount_uploader :image, ImageUploader

  validates :airport_name, presence: true
  validates :prefecture, presence: true
  validates :impression, presence: true, length: {minimum: 10}
end
