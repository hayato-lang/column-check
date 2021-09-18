class LikeCommentsController < ApplicationController
  def create
    @comment = Comment.find(params[:comment])
    current_user.like(@comment)
  end

  def destroy
    @comment = Like.find(params[:id]).comment
    current_user.unlike(@comment)
  end
end
