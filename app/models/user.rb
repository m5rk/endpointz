class User < ApplicationRecord
  has_secure_password

  has_many :medications
  has_many :playlists
  has_many :playlist_imports

  validates :email, presence: true, uniqueness: true
end
