class RegisteredApplication < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy

  validates :name, length: { minimum: 5 }, presence: true
  validates :url, length: { minimum: 4 }, presence: true
  validates :user, presence: true
end
