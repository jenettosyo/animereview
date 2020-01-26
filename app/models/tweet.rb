class Tweet < ApplicationRecord

  belongs_to :user
  has_many :comments
  mount_uploader :picture, PictureUploader
  validates :text, presence: true
  validates :picture, presence: true
end
