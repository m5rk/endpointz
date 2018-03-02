class User < ApplicationRecord
  has_secure_password

  has_many :medications

  validates :email, presence: true, uniqueness: true
end
