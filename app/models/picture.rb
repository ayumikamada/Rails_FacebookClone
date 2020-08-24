class Picture < ApplicationRecord
  belongs_to :user, optional: true
  validates :title, presence: true
  validates :content, presence: true
  mount_uploader :image, ImageUploader
end
