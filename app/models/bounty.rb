class Bounty < ApplicationRecord
  belongs_to :user

  validates :title, :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
