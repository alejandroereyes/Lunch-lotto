class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  skip_before_action :verify_authenticity_token

  before_filter :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authenticate_user!
    unless current_user
      flash[:alert] = "You need to log in"
      redirect_to login_path
    end
  end
end
