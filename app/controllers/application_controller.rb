# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    redirect_to sign_in_path, alert: 'you must be logged in' if Current.user.nil?
  end
end
