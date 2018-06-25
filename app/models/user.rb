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
end
