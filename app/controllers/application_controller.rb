class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def authenticate_user!
    if current_user == nil
      redirect_to login_path, alert: "You must be logged in"
    end
  end
end
