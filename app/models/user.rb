class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, complex_password: true

  has_many :bounties, dependent: :destroy
end
