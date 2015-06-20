class User < ActiveRecord::Base
  has_secure_password
  has_many :foods, dependent: :destroy
  has_many :matches, dependent: :destroy
  has_many :messages, dependent: :destroy
  

  def self.match_a_user(session)
    current_user = User.find(session[:user_id]) #get current user
    requested_network = current_user[:network] # get current user's network
    users_in_network = User.where(network: requested_network) #find all user's who match network
    # find all user's who match on 3 columns...Wat!?
    possible_matches = [] # look at each user in network
    users_in_network.each do |user|
      # check to see how many matches they have with current user
      good_match = number_of_matches
      # store any user who hits 3+ matches in an array
      possible_matches + good_match if good_match >= 3
    end
    # user random select, range is up to array length - 1, to select a random user
    pick = SecureRandom.random_number(possible_matches.size)
    paired_user = possible_matches[pick]
  end

  def number_of_matches
    counter = 0
    counter = user.foods[:easy_breezy] == current_user.foods[:easy_breezy] ? counter + 1 : counter
    counter = user.foods[:health_nut] == current_user.foods[:health_nut] ? counter + 1 : counter
    counter = user.foods[:wild_child] == current_user.foods[:wild_child] ? counter + 1 : counter
    counter = user.foods[:lux_lunch] == current_user.foods[:lux_lunch] ? counter + 1 : counter
    counter = user.foods[:casual_sit_down] == current_user.foods[:casual_sit_down] ? counter + 1 : counter
    counter
  end

  def self.matching_food_preferences(user) # store the 3 matches to send user info about why they got this user
    info = []
    info = user.foods[:easy_breezy] == current_user.foods[:easy_breezy] ? info + "Easy Breezy" : info
    info = user.foods[:health_nut] == current_user.foods[:health_nut] ? info + "Health Nut" : info
    info = user.foods[:wild_child] == current_user.foods[:wild_child] ? info + "Wild Child" : info
    info = user.foods[:lux_lunch] == current_user.foods[:lux_lunch] ? info + "Lux Lunch" : info
    info = user.foods[:casual_sit_down] == current_user.foods[:casual_sit_down] ? info + "Casual Sit Down" : info
    info
  end
end
