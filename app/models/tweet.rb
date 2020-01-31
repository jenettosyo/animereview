class Tweet < ApplicationRecord

  belongs_to :user
  has_many :comments
  mount_uploader :picture, ImageUploader
  validates :text, presence: true
  validates :picture, presence: true

  def self.search(search)
    return Tweet.all unless search
    Tweet.where('text LIKE(?)', "%#{search}%")
  end
end
