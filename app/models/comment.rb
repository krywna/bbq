class Comment < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :user_name, unless: -> { user.present? }

  def user_name
    if user.present?
     user.name
    else
     super
    end
  end

end
