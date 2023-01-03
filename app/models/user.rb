class User < ApplicationRecord
  has_many :events

  before_validation :downcase_name, :downcase_email

  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w\.-]+@[A-Za-z\d\-\.+]+\.[a-z]+\z/}
  validates :name, presence: true, uniqueness: true, length: { maximum: 40 }, format: { with: /\A\w+\z/}

  def downcase_name
    name.downcase!
  end

  def downcase_email
    email.downcase!
  end
end
