class Picture < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
end
