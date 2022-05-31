class UpdatePostsController < ApplicationController
  before_action :logged_in?

  def edit
    @post = Post.find_by(id: params[:format])
  end

  def update 
    post = Post.find_by(id: params[:format])
    if post.update(post_params)
      redirect_to root_path, notice: "Post was updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private 

  def post_params 
    params.require(:post).permit(:title, :content)
  end
end
