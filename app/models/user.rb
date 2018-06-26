class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :participations
  has_many :lists, through: :participations
  has_many :owner_lists, class_name: "List", inverse_of: :owner, foreign_key: :owner

  has_many :gifts, inverse_of: :giver

  def full_name
    "#{first_name} #{last_name}"
  end

  after_create :send_welcome_email

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end
end
