class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :user_name, unless: -> { user.present? }
  validates :user_email, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/, unless: -> { user.present? }
  validates :user, uniqueness: {scope: :event_id}, if: -> { user.present? }
  validate :user_email_self_subscription, if: -> { user.present? }
  validates :user_email, uniqueness: {scope: :event_id}, unless: -> { user.present? }
  validate :user_email_busyness, unless: -> { user.present? }

  def user_name
    if user.present?
    user.name
    else
    super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

private

  def user_email_self_subscription
    errors.add(:user_email, :self_subscription) if user == event.user
  end

  def user_email_busyness
    errors.add(:user_email, :taken) if User.find_by(email: user_email).present?
  end

end
