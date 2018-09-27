class Event < ApplicationRecord
  validates :name, length: {maximum: 50}
  validates :context, length: (maximum: 280)
  belongs_to :user
  has_many :attends, :dependent => :delete_all
end
 