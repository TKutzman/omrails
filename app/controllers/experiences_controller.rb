class ExperiencesController < ApplicationController
  before_action :authenticate_user! except: [:index, :show]

  # GET /experiences
  def index
    @experiences = Experience.all
  end

  # GET /experiences/1
  def show
    @experience = Experience.find(params[:id])
  end

  # GET /experiences/new
  def new
    @experience = current_user.experiences.new
  end

  # GET /experiences/1/edit
  def edit
    @experience = current_user.experiences.find(params[:id])
  end

  # POST /experiences
  def create
    @experience = current_user.experiences.new(experience_params)
    if @experience.save
    redirect_to @experience, notice: 'Experience was successfully shared.'
      else
        render :new
    end
  end

  # PATCH/PUT /experiences/1
  def update
    @experience = current_user.experiences.find(params[:id])
      if @experience.update(experience_params)
        redirect_to  @experience, notice: 'Experience was successfully updated.'
      else
        render :edit 
        
      end
  end

  # DELETE /experiences/1
  def destroy
    @experience = current_user.experiences.find(params[:id])
    @experience.destroy
    redirect_to experiences_url, notice: 'Experience was successfully destroyed.' 
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def experience_params
      params.require(:experience).permit(:user_id, :topic, :content)
    end
 
