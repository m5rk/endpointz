class Playlist < ApplicationRecord
  belongs_to :user

  has_many :playlist_songs
  has_many :songs, through: :playlist_songs

  def self.import(user, data)
    playlist = user.playlists.create

    require 'csv'

    CSV.parse(data, headers: true) do |row|
      song = Song.where(name: row['song_name']).first!
      playlist.songs << song
    end
  end
end
