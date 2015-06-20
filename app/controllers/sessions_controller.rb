class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user != nil && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path
    else
      flash[:alert] = "Hi, looks like your email or password does not match"
      render :new
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
