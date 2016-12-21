class FeedController < ApplicationController
	before_action :authenticate_user!

  def show
  	@experiences = Experience.where(user: current_user.all_following)
  end

end