class Subscription < ApplicationRecord
  belongs_to :customer
  has_many :subscription_teas
  has_many :teas, through: :subscription_teas

  validates_presence_of :title
  validates_inclusion_of :status, in: [true, false]
  validates_numericality_of :frequency
end