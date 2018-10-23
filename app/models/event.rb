class Event < ApplicationRecord
  validates :name, length: {maximum: 140}
  validates :context, length: {maximum: 2000}
  validates :place, length: {maximum: 240}
  validates :contact, length: {maximum: 240}
  belongs_to :user
  has_many :attends, :dependent => :delete_all
  has_one_attached :event_image
end
 