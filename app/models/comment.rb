class Comment < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :body, presence: true, length: {maximum: 50}
  validates :event, presence: true
  validates :user_name, presence: true, length: {maximum: 15}, unless: -> { user.present? }

  def user_name
    if user.present?
     user.name
    else
     super
    end
  end
end
