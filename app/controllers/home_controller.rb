# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @post = Post.all
  end
end
