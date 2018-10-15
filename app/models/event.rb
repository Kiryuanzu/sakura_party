class Event < ApplicationRecord
  validates :name, length: {maximum: 100}
  validates :context, length: {maximum: 1300}
  validates :place, length: {maximum: 240}
  validates :contact, length: {maximum: 240}
  belongs_to :user
  has_many :attends, :dependent => :delete_all
end
 