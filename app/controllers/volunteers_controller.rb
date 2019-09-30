class VolunteersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @volunteers = User.all
  end

  def show
  end

  def new
    @volunteer = User.new
  end

  def edit
  end

  def create
    @volunteer = User.new(volunteer_params)
    
    respond_to do |format|
      if @volunteer.save
        format.html { redirect_to @volunteer, notice: 'Volunteer was successfully created.' }
        format.json { render :show, status: :created, location: @volunteer }
      else
        format.html { render :new }
        format.json { render json: @volunteer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
  end

  private
    def set_volunteer
      @volunteer = User.find(params[:id])
    end

    def volunteer_params
      params.require(:volunteer).permit(:first_name, :last_name)
    end
end
