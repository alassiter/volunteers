class OpportunitiesController < ApplicationController
  before_action :set_opportunity, only: [:show, :edit, :update, :destroy]

  def index
    @opportunities = Opportunity.all
  end

  def show
    @volunteers = @opportunity.volunteers.to_a
    @assignment = @opportunity.volunteers.build(
      first_name: current_user&.first_name,
      last_name: current_user&.last_name,
      email: current_user&.email
    )
  end

  def new
    @opportunity = Opportunity.new
  end

  def edit
  end

  def create
    @opportunity = Opportunity.new(opportunity_params)

    if @opportunity.save
      redirect_to opportunities_url, notice: 'Opportunity was successfully created.'
    else
      render :new
    end
  end

  def update
    @volunteer = Volunteer.find_by(email: opportunity_with_volunteer_params[:volunteers][:email])

    if @volunteer
      if @opportunity.volunteers.include?(@volunteer)
        redirect_to opportunities_url, flash: { alert: "You've already signed up for #{@opportunity.name}" }
      else
        @opportunity.volunteers << @volunteer
        redirect_to opportunity_url(@opportunity), notice: "You have signed up for #{@opportunity.name}"
      end
    else
      if @opportunity.update(opportunity_params)
        redirect_to opportunities_url, notice: 'Opportunity was successfully updated.'
      else
        render :edit
      end
    end
  end

  def destroy
    @opportunity.destroy
    
    redirect_to opportunities_url, notice: 'Opportunity was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opportunity
      @opportunity = Opportunity.includes(:volunteers).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def opportunity_params
      params.require(:opportunity).permit(
        :name, 
        :description,
        :tools_needed,
        :skills_needed
      )
    end

    def opportunity_with_volunteer_params
      params.require(:opportunity).permit(
        volunteers: [
          :id,
          :first_name,
          :last_name,
          :email,
          :_destroy
        ]
      )
    end
end
