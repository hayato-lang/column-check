class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  has_many :posts
  has_many :comments
  has_many :like_comments, dependent: :destroy
  has_many :like_posts, dependent: :destroy

  def liked_post_by?(post_id)
    like_posts.where(post_id: post_id).exists?
  end

  def liked_comment_by?(comment_id)
    like_comments.where(comment_id: comment_id).exists?
  end

end
