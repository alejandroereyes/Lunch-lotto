class User < ActiveRecord::Base
  has_secure_password
  has_many :foods, dependent: :destroy
  has_many :matches, dependent: :destroy
  has_many :messages, dependent: :destroy
  validates :name, presence: { message: "Hi, looks like you forgot to add your name." }

  def self.match_a_user_to(user)
    current_user = user #get current user
    requested_network = current_user[:network] # get current user's network
    users_in_network = User.where(network: requested_network) #find all user's who match network
    # find all user's who match on 3 columns
    possible_matches = []
    # look at each user in network
    users_in_network.each do |user|
      # check to see how many matches they have with current user
      good_match = number_of_matches(user, current_user)
      # store any user who hits 3+ matches in an array
      possible_matches << user if good_match >= 3 && user[:id] != current_user[:id]
    end
    # user random select, range is up to array length - 1, to select a random user
    pick = SecureRandom.random_number(possible_matches.size)
    paired_user = possible_matches[pick]
  end

  def self.number_of_matches(paired_user, current_user)
    counter = 0
    counter = paired_user.foods[0][:easy_breezy]     == current_user.foods[0][:easy_breezy] ?     counter + 1 : counter
    counter = paired_user.foods[0][:health_nut]      == current_user.foods[0][:health_nut] ?      counter + 1 : counter
    counter = paired_user.foods[0][:wild_child]      == current_user.foods[0][:wild_child] ?      counter + 1 : counter
    counter = paired_user.foods[0][:lux_lunch]       == current_user.foods[0][:lux_lunch] ?       counter + 1 : counter
    counter = paired_user.foods[0][:casual_sit_down] == current_user.foods[0][:casual_sit_down] ? counter + 1 : counter
    counter
  end

  def self.matching_food_personalities(matched_user,current_user) # store the 3 matches to send user info about why they got this user
    info = []
    info = matched_user.foods[0][:easy_breezy]     == current_user.foods[0][:easy_breezy] ?     info << "Easy Breezy" : info
    info = matched_user.foods[0][:health_nut]      == current_user.foods[0][:health_nut] ?      info << "Health Nut" : info
    info = matched_user.foods[0][:wild_child]      == current_user.foods[0][:wild_child] ?      info << "Wild Child" : info
    info = matched_user.foods[0][:lux_lunch]       == current_user.foods[0][:lux_lunch] ?       info << "Lux Lunch" : info
    info = matched_user.foods[0][:casual_sit_down] == current_user.foods[0][:casual_sit_down] ? info << "Casual Sit Down" : info
    info
  end
end
