class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  validates :name, length: {maximum: 35}

  before_validation :set_name, on: :create
  after_commit :link_subscriptions, on: :create

  private

  def set_name
    self.name = "AVATAR №#{rand(999)}" if self.name.blank?
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email).update_all(user_id: self.id)
  end
end
