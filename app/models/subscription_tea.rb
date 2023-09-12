class SubscriptionTea < ApplicationRecord
  belongs_to :subscription
  belongs_to :tea

  validates_numericality_of :quantity
end