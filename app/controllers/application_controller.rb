class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  skip_before_action :verify_authenticity_token

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  helper_method :current_user

  def authenticate_user!
    if current_user == nil
      redirect_to login_path, alert: "You must be logged in"
    end
  end
end
