Rails.application.routes.draw do
  resource :authentication, only: :create
end
