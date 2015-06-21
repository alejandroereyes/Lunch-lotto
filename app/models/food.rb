class Food < ActiveRecord::Base
  belongs_to :user

  def self.enter_foods_via_user(user, params)

    if Food.find_by(user[:id]) # if user has food presona
      foods = Food.find(user[:id])
      save_food_personality(foods, params)
    else # user doesn't have food presona
      foods = Food.create(user_id: user[:id])
      save_food_personality(foods, params)
    end
  end

  def self.save_food_personality(user_foods, params)
    user_foods[:easy_breezy]     = params[:easy_breezy]
    user_foods[:healh_nut]       = params[:healh_nut]
    user_foods[:wild_child]      = params[:wild_child]
    user_foods[:lux_lunch]       = params[:lux_lunch]
    user_foods[:casual_sit_down] = params[:casual_sit_down]
    user_foods.save
  end
end
