class UsersController < ApplicationController

def create 
	@user = User.create(user_params)
	@user.save
	render json: @user
end

def user_params
	params.require(:user).permit(:name, :email, :password, :password_confirmation, :twitter, :linked_in, :network_circle)
end
end
