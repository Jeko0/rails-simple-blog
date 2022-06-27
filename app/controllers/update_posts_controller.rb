# frozen_string_literal: true

class UpdatePostsController < ApplicationController
  before_action :logged_in?

  def edit
    @post = Post.find_by(id: params[:format])
  end

  def update
    post = Post.find_by(id: params[:format])
    if @post = Post.find_by(id: params[:format], user_id: Current.user.id)
      redirect_to root_path, notice: 'Post was updated'
    else
      redirect_to root_path, alert: 'this is not your post'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
