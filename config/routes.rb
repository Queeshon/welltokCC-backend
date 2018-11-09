Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :articles, only: [:index, :create, :update, :destroy]
      resources :authors, only: [:index, :create, :update, :destroy]
      resources :tags, only: [:index, :create]
    end
  end
end
