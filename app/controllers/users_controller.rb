class UsersController < ApplicationController

  def index

    @user = User.all
    render json: @user
  end

  def show
    if authenticate_user!
      begin
        @user = User.find(session(:user_id))
        render json: @user
      rescue ActiveRecord::RecordNotFound => error
        render json: { error: "User not Found" }, status: 404
      end
    else
      render json: { error: "Access Denied" }, status: 407
    end
  end

  def new
    @user = User.new
    render json: @user
  end

  def get_a_match
    @current_user = User.find(session[:user_id])
    @user_match = User.match_a_user_to(@current_user)
    @user_match_hits = User.matching_food_personalities(@user_match, @current_user )
    render json: { matched_user: @user_match, match_hits: @user_match_hits }
  end

  def create
    @user = User.create(name: params[:name], password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user
      render json: @user
    else
      render json: { error: "User not saved" }, status: 500
    end
  end

  def destory
    @user = User.find_by_email(params[:email])
    @user.destory
    redirect_to root_path
  end
end
