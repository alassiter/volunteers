class Opportunity < ApplicationRecord
  has_many :assignments
  has_many :volunteers, through: :assignments

  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true, reject_if: proc { |attributes| attributes['image'].blank? }

  def filled?
    return false if volunteers_needed.to_i == 0

    volunteers.count >= volunteers_needed
  end

  def volunteers_remaining
    return 0 if volunteers_needed.nil?
    
    volunteers_needed - volunteers.count
  end
end
