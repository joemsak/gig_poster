class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, complex_password: true

  normalizes :email, with: ->(email) { email.strip.downcase }

  has_many :bounties, dependent: :destroy

  def name
    return email if first_name.blank?
    "#{first_name} #{last_name[0]}."
  end

  def initials
    return unless first_name.present? && last_name.present?
    "#{first_name[0]}#{last_name[0]}"
  end
end
