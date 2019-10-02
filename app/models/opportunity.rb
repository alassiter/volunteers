class Opportunity < ApplicationRecord
  has_many :assignments
  has_many :volunteers, through: :assignments
end
