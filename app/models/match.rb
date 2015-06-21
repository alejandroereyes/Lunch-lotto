class Match < ActiveRecord::Base
  has_many :messages
  belongs_to :user

  def self.match_two_users(matched_user, current_user)
    # check if user has been matched already
    if user_has_a_match_today?(matched_user, current_user)
      { current: find_match_for(current_user), matched: find_match_for(matched_user) }
    else
      match_id = SecureRandom.hex # generate unique match id
      @current_user_match = Match.new # create new match for current
      @matched_user_match = Match.new # create new match for matched user
      # fill out fields for current user & save
      @current_user_match[:match_id]   = match_id
      @current_user_match[:user_id]    = current_user[:id]
      @current_user_match[:pair]       = matched_user[:id]
      @current_user_match[:day]        = Time.now.strftime("%m/%d/%Y")
      @current_user_match.save
      # fill out fields for matched user & save
      @matched_user_match[:match_id]   = match_id
      @matched_user_match[:user_id]    = matched_user[:id]
      @matched_user_match[:pair]       = current_user[:id]
      @matched_user_match[:day]        = Time.now.strftime("%m/%d/%Y")
      @matched_user_match.save
      # return match id
      { current: @current_user_match, matched: @matched_user_match }
    end
  end

  def self.user_has_a_match_today?(matched_user, current_user)
    if find_match_for(current_user)
      true
    else
      false
    end
  end

  def self.find_match_for(user)
    user.matches.find_by(day: "#{Time.now.strftime("%m/%d/%Y")}")
  end
end
