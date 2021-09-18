class Post < ApplicationRecord
  belongs_to :user
  has_many :like_posts
  has_many :comments
  with_options presence: true do
    validates :title
    validates :description
  end
end
