class List < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id', inverse_of: :lists

  enum status: {open: 0, closed: 1}

  has_many :users, through: :participations
  has_many :gifts, dependent: :destroy, inverse_of: :list
  has_many :participations

  accepts_nested_attributes_for :gifts,
                                allow_destroy: true,
                                reject_if: proc {|att| att['name'].blank? }

  validates :name, uniqueness: true
  validates :name, presence: true

  def default_status
    0
  end

  def default_name
    "Ma Liste de Nöel" if name.nil?
  end

end
