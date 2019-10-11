class Volunteer < User
  has_many :assignments
  has_many :opportunities, through: :assignments
  
  before_validation :set_random_password, on: [:create]

  private
  def set_random_password
    return if password.present?

    self.password = SecureRandom.hex
    self.password_confirmation = password
  end
end
