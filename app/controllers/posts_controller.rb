# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :logged_in?
  def new
    @post = Post.new
  end

  def show
    @post = Post.find_by(id: params[:format])
  end

  def create
    @post = Current.user.posts.new(post_info)
    if @post.save
      redirect_to root_path, notice: 'Post created'
    else
      render :new
    end
  end

  def destroy
    if @post = Post.find_by(id: params[:format], user_id: Current.user.id)
      @post.destroy
      redirect_to root_path, notice: 'Post Deleted!'
    else
      redirect_to root_path, alert: 'this is not your post'
    end
  end

  private

  def post_info
    params.require(:post).permit(:title, :content)
  end
end
