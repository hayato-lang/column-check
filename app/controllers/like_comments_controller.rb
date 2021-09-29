class LikeCommentsController < ApplicationController
  before_action :comment_params
  def create
    LikeComment.create(user_id: current_user.id, comment_id: params[:id])
  end

  def destroy
    LikeComment.find_by(user_id: current_user.id, comment_id: params[:id]).destroy
  end

  private

  def comment_params
    @comment = Comment.find(params[:id])
  end
end
