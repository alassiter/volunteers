class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ADMINS = %w(
    geoff@eastsidepres.com
    anthonylassiter@gmail.com
  )

  def is_admin?
    ADMINS.include?(email)
  end
  
  def name
    "#{first_name} #{last_name}"
  end
end
