class Event < ApplicationRecord
  validates :name, length: {maximum: 50}
  validates :context, length: {maximum: 1300}
  validates :place, length: {maximum: 140}
  validates :contact, length: {maximum: 140}
  belongs_to :user
  has_many :attends, :dependent => :delete_all
end
 