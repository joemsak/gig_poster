class Bounty < ApplicationRecord
  validates :title, :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
