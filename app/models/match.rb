class Match < ActiveRecord::Base
  has_many :messages
  belongs_to :user
  def self.match_two_users(matched_user, current_user)
    # check if users have a match already
    # if not_already_matched_today?
      match_id = SecureRandom.hex # generate unique match id
      @current_user_match = Match.new # create new match for current
      @matched_user_match = Match.new # create new match for matched user
      # fill out fields for current user & save
      @current_user_match[:match_id] = match_id
      @current_user_match[:user_id] = current_user[:id]
      @current_user_match[:pair] = matched_user[:id]
      @current_user_match.save
      # fill out fields for matched user & save
      @matched_user_match[:match_id] = match_id
      @matched_user_match[:user_id] = matched_user[:id]
      @matched_user_match[:pair] = current_user[:id]
      @matched_user_match.save
      # return match id
      { current: @current_user_match, matched: @matched_user_match }
    # else
    #   render json: { error: "Sorry, you can only be paried once a day" }, status: 423
    # end
  end

  def can_this_user_be_matched?

  end
end
