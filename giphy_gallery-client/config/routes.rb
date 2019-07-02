Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create, :update]
  resources :comments, only: [:index, :show, :create, :destroy]
  resources :gifs
end
