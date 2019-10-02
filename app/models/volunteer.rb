class Volunteer < User
  has_many :assignments
  has_many :opportunities, through: :assignments
  
  before_create :set_random_password

  private
  def set_random_password
    SecureRandom.hex
  end
end
