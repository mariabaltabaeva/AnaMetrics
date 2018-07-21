class Event < ApplicationRecord
  belongs_to :registered_application

  validates :name, length: { minimum: 3 }, presence: true
  validates :registered_application, presence: true
end
