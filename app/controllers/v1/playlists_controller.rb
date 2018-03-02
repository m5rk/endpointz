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
  end
end
