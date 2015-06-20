class UsersController < ApplicationController

  def index
    @user = User.all
    render json: @user
  end

  def show

  end

  def new
    @user = User.new
    render json: @user
  end

  def get_a_match
  end

  def create
    @user = User.create(name: params[:name], password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user
      render json: @user
    else
      flash[:alert] = "Error Occured!"
      render :new
    end
  end

  def destory
    @user = User.find_by_email(params[:email])
    @user.destory
    redirect_to root_path
  end
end
