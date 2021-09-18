class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :like_comments
  validates :text, presence: true
  has_many :liked_comments, through: :likes, source: :user
end

