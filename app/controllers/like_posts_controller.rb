class LikePostsController < ApplicationController
  before_action :post_params

  def create
    LikePost.create(user_id: current_user.id, post_id: params[:id])
  end

  def destroy
    LikePost.find_by(user_id: current_user.id, post_id: params[:id]).destroy
  end

  private

  def post_params
    @post = Post.find(params[:id])
  end
end
