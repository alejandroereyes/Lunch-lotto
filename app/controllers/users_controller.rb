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
    # render json: params
    @user = User.new
    # @user[:name] = params[:name]
    # @user[:email] = params[:email]
    # @user[:password] = params[:password]
    if @user.save
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

  private
  # def user_params
  #   params.require(:user).permit(:name, :email, :password, :password_confirmation, :twitter, :linked_in, :network)
  # end
end
