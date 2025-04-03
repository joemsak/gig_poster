class Bounty < ApplicationRecord
  belongs_to :user

  validates :title, :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }

  def postal_code
    super || user.postal_code
  end

  def user_email
    user.email
  end
end
