class UsersController < ApplicationController

  def show
    # if authenticate_user!
      begin
        @user = User.find(params[:id]) # replace with session before deploy
        @foods = @user.foods.first
        render json: { user: @user, foods: @foods }
      rescue ActiveRecord::RecordNotFound => error
        render json: { error: "User not Found" }, status: 404
      end
    # else
      # render json: { error: "Access Denied" }, status: 407
    # end
  end

  def profile # show current user profile
    # if authenticate_user!
      begin
        @user = User.find(params[:id]) # replace with session before deploy
        @foods = @user.foods.first
        render json: { user: @user, foods: @foods }
      rescue ActiveRecord::RecordNotFound => error
        render json: { error: "User not Found" }, status: 404
      end
    # else
      # render json: { error: "Access Denied" }, status: 407
    # end
  end

  def new
    @user = User.new
    render json: @user
  end

  def get_a_match
    @current_user         = User.find(params[:user_id]) # remove params and insert session before deploy
    @user_match           = User.match_a_user_to(@current_user) # find a match for user
    @user_match_hits      = User.matching_food_personalities(@user_match, @current_user)
    @matched_users_binder = Match.match_two_users(@user_match, @current_user)

    render json: { matched_user: @user_match, match_hits: @user_match_hits, matched_users: @matched_users_binder }
  end

  def create
    @user = User.create(email: params[:email], password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      render json: @user
    else
      render json: { error: "User not saved" }, status: 500
    end
  end

  def update
    begin
      # @user = User.find_by(session[:id]) # use session id to find user
      @user = User.find_by(email: params[:email]) # remove before deplay

      @user[:name]      = params[:name]
      @user[:network]   = params[:network]
      @user[:bio]       = params[:bio]       if @user[:bio]       != params[:bio]       && params[:bio]     != nil
      @user[:linked_in] = params[:linked_in] if @user[:linked_in] != params[:linked_in] && params[:twitter] != nil
      @user[:twitter]   = params[:twitter]   if @user[:twitter]   != params[:twitter]   && params[:twitter] != nil

      Food.enter_foods_via_user(@user, params)

      if @user.save
        render json: { message: "Your profile has been saved" }
      else
        render json: { error: "Your profile was not saved" }, status: 500
      end
    rescue ActiveRecord::RecordNotFound => error
      render json: { error: error.message }, status: 404
    end
  end

  def destory
    # if authenticate_user!
      @user = User.find_by_email(params[:email])
      @user.destory
      redirect_to root_path
      # else
      # render json: { error: "Access Denied" }, status: 407
    # end
  end
end
