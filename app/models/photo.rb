class Photo < ApplicationRecord
  belongs_to :event
  belongs_to :user

  mount_uploader :photo, PhotoUploader

  scope :persisted, -> { where "id IS NOT NULL" }

  validates :photo, presence: true
end
