class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments
  with_options presence: true do
    validates :title
    validates :description
  end
end
