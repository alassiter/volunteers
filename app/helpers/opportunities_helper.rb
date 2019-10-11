module OpportunitiesHelper
  def volunteers_needed_text(opportunity)
    return "Volunteers Needed" if opportunity.volunteers_needed.nil?
    return "Volunteers Filled" if opportunity.filled? 

    "Volunteers Needed: #{opportunity.volunteers_remaining}"
  end
end
