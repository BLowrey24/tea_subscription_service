class Tea < ApplicationRecord
  has_many :subscription_teas
  has_many :subscriptions, through: :subscription_teas
  has_many :customers, through: :subsriptions

  validates_presence_of :title
  validates_presence_of :description
  validates_numericality_of :temperature
  validates_numericality_of :brew_time
end