class FoodsController < ApplicationController
  def new
    @foods = Food.new
    render json: @foods
  end

  def show
    @foods = Food.find(session[:user_id])
    render @foods
  end

  def create
    @foods = Food.new
    if authenticate_user! && !(Food.exists?(user_id: session[:user_id]))
      @foods[:user_id] = session[:user_id]
      @foods[:easy_breezy] = params(:easy_breezy)
      @foods[:health_nut] = params(:health_nut)
      @foods[:wild_child] = params(:wild_child)
      @foods[:lux_lunch] = params(:lux_lunch)
      @foods[:casual_sit_down] = params(:casual_sit_down)
      if @foods.save
        render json: @foods
      else
        render json: { error: "problem saving foods, check params", params: params }, status: 500
      end
    else
      render json: { error: "User not found" }, status: 404
    end
  end

  def update
    if authenticate_user
      @foods = Food.find_by_user_id(params)
    else
      render json: { error: "User not found" }, status: 404
    end
  end
end
