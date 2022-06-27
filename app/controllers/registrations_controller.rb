# frozen_string_literal: true

class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_info)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Registered successfully'
    else
      render :new
    end
  end

  private

  def user_info
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
