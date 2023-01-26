class Event < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :user, dependent: :destroy

  validates :title, presence: true, length: {maximum: 50}
  validates :address, presence: true, length: {maximum: 100}
  validates :description, length: {maximum: 50}
  validates :datetime, presence: true

  def visitors
    (subscribers + [user]).uniq
  end
end
