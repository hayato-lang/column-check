class LikePostsController < ApplicationController
  def create
    @post = Post.find(params[:post])
    current_user.like(@comment)
  end

  def destroy
    @post = Like.find(params[:id]).post
    current_user.unlike(@post)
  end  
end
