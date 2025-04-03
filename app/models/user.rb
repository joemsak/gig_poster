class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, complex_password: true

  normalizes :email, with: ->(email) { email.strip.downcase }

  has_many :bounties, dependent: :destroy

  def full_name
    if first_name.blank? && last_name.blank?
      email
    else
      [first_name, last_name].join(" ")
    end
  end
end
