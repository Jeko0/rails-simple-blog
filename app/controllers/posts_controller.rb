class PostsController < ApplicationController
  def new 
    @post = Post.new
  end

  def show 
    @post = Post.find_by(id: params[:id])
  end

  def create 
    @post = Current.user.posts.new(post_info)
    if @post.save 
      redirect_to root_path, notice: "Post created"
    else
      render :new
    end
  end

  def destroy 
    @post = Post.find_by(id: params[:format])
    @post.destroy 

    redirect_to root_path, notice: "Post Deleted!"
  end

  private

  def post_info
    params.require(:post).permit(:title, :content)
  end
end
