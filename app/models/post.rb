class Post < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_one_attached :post_image
end
