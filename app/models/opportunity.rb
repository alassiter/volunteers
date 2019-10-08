class Opportunity < ApplicationRecord
  has_many :assignments
  has_many :volunteers, through: :assignments

  def filled?
    return false if volunteers_needed.to_i == 0

    volunteers.count >= volunteers_needed
  end
end
