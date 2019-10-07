class AssignmentsController < ApplicationController
  before_action :set_opportunity, only: [:signup]

  def index
  end

  def show
  end

  def signup
    @volunteers = @opportunity.volunteers
    @opportunity.volunteers.build
    # provide a list of those already signed up for the opportunity
    # create a new assignment for the form
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opportunity
      @opportunity = Opportunity.includes(:volunteers).find(params[:opportunity])
    end
end
