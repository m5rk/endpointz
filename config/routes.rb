Rails.application.routes.draw do
  api_version(module: 'V1', path: { value: 'v1' }) do
    resource :authentication, only: :create

    resources :medications, only: [:create, :index]
    resources :playlists, only: [:create, :index] do
      member do
        put :add_song
      end
    end
  end
end
