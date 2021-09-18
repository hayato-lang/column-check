class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

          validates :name, presence: true
          validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  has_many :posts
  has_many :comments
  has_many :like_comments, dependent: :destriy
  has_many :liked_comments, through: :likes, source: :comment
  has_many :like_posts, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
end
