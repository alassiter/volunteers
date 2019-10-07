class OpportunitiesController < ApplicationController
  before_action :set_opportunity, only: [:show, :edit, :update, :destroy]

  def index
    @opportunities = Opportunity.all
  end

  def show
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
    if @opportunity.update(opportunity_params)
      redirect_to opportunities_url, notice: 'Opportunity was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @opportunity.destroy
    
    redirect_to opportunities_url, notice: 'Opportunity was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opportunity
      @opportunity = Opportunity.find(params[:id])
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
end
