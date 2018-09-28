class Attend < ApplicationRecord
  validates :comment, presence: true
  validates :mind, presence: true
  belongs_to :user
  belongs_to :event
end
