class Event < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :user, dependent: :destroy

  validates :title, length: {maximum: 280}

  def visitors
    (subscribers + [user]).uniq
  end
end
