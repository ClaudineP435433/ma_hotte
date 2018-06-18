class Gift < ApplicationRecord
  belongs_to :list
  belongs_to :giver, class_name: 'User', foreign_key: 'giver_id', inverse_of: :gifts, optional: true


  has_many_attached :images

  enum status: {available: 0, booked: 1, bought: 2}
  validates :name, presence: true
end
