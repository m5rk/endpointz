Rails.application.routes.draw do
  api_version(module: 'V1', path: { value: 'v1' }) do
    resource :authentication, only: :create
    resource :medications, only: :create
  end
end
