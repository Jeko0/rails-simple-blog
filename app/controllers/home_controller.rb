class HomeController < ApplicationController
  before_action :logged_in?
  def index
    @post = Post.all
  end
end
