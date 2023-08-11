class Post < ApplicationRecord
  belongs_to :user

  has_many_attached :image

  validates :airport_name, presence: true
  validates :impression, presence: true, length: { minimum: 5 }
  validates :image, presence: true
end
