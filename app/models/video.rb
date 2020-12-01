class Video < ApplicationRecord
  belongs_to :user
  has_one_attached :clip
  has_one_attached :thumbnail

  validates :title, :description, :clip, :thumbnail, :url, presence: true
  validates :url, format: {with: /\w+\/\w+\.mp4/ }
end
