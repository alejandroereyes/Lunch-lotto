class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user
    else
      render json: { error: "User data does not match" }, status: 421
    end
  end

  def destroy
    session[:user_id] = nil
    render json: { message:'see ya later' }
  end
end
