class Video < ApplicationRecord
  has_one_attached :clip
  has_one_attached :thumbnail

  validates :title, :description, presence: true
end
