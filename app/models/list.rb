class List < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id', inverse_of: :lists

  enum status: {open: 0, closed: 1}

  has_many :users, through: :participation
  has_many :gifts
end
