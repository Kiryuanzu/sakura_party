class Attend < ApplicationRecord
  validates :comment, length: (maximum: 140)
  validates :mind
  belongs_to :user
  belongs_to :event
end
