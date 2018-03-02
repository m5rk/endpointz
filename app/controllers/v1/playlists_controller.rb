module V1
  class PlaylistsController < AuthenticatedController
    def create
      playlist = current_user.playlists.create(name: params[:name])

      render jsonapi: playlist, status: :created
    end

    def index
      playlists = current_user.playlists

      render jsonapi: playlists
    end

    def add_song
      playlist = current_user.playlists.find_by_id(params[:id])
      song = Song.find_by_id(params[:song_id])

      head :not_found and return unless playlist && song

      playlist.songs << song

      render jsonapi: playlist, include: [:songs], fields: { songs: [:name] }
    end
  end
end
