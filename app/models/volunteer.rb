class Volunteer < User
  before_create :set_random_password

  private
  def set_random_password
    SecureRandom.hex
  end
end
