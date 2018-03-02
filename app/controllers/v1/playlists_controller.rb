module V1
  class PlaylistsController < AuthenticatedController
    def index
      playlists = current_user.playlists

      render jsonapi: playlists
    end
  end
end
