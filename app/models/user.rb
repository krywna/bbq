class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :set_name, on: :create

  has_many :events

  has_many :comments, dependent: :destroy

private

  def set_name
    self.name = "Persone №#{rand(999)}" if self.name.blank?
  end
end
