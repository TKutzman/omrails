class UsersController < ApplicationController
  def show
  	@user = User.find_by(username: params[:username])
  	@experiences = @user.experiences.all
  end

end
