class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :participations
  has_many :lists, through: :participations
  has_many :owner_lists, class_name: "List", inverse_of: :owner, foreign_key: :owner

  has_many :gifts, inverse_of: :giver

  #has_many :gift_lists, -> { where(like: true) }, class_name: "List", through: :participations, source: :list
  # has_many :gift_lists, :through => :participations, :source => :list, :conditions => "participations.user = current_user"

  def full_name
    "#{first_name} #{last_name}"
  end
end
