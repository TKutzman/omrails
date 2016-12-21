class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    experience = Experience.find(params[:id])
    experience.liked_by current_user
    redirect_to experiences_path, notice: "You successfully liked an experience"
  end

  def destroy
  	experience = Experience.find(params[:id])
    experience.unliked_by current_user
    redirect_to experiences_path, notice: "You successfully unliked an experience"
  end

end