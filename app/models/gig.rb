class Gig < ApplicationRecord
  validates :title, :bounty, presence: true
  validates :bounty, numericality: { greater_than: 0 }
end
