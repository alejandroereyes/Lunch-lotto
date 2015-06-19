class UsersController < ApplicationController

  def index
    @user = User.all
    render json: @user
  end

  def new
    @user = User.new
    render json: @user
  end

  def create
    @user = User.create(user_params)
    render json: @user
  end

  def destory
    @user = User.find_by_email(params[:email])
    @user.destory
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :twitter, :linked_in, :network_circle)
  end
end
