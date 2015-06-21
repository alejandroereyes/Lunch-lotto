class MessagesController < ApplicationController
  def show
    # authenticate user
    @user = User.find(params[:id]) #session[:user_id] # get user_id
    @event_id = @user.matches.first[:event_id] # use user_id to find event_id
    @messages = Message.where(event_id: @event_id) # user event_id to find all messages
    render json: @messages # render all messages
  end

  def create
    # authenticate user
    @user = User.find(params[:user_id]) #session[:user_id] # get user_id
    @event_id = @user.matches.first[:event_id] # use user_id to find event_id
    @message =  Message.create(post: params[:post], user_id: @user, event_id: @event_id) # save message with user_id, and event_id
    render json: @message # render back new message
  end
end
