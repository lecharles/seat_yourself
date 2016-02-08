Rails.application.routes.draw do

  root 'restaurants#index'

  resources :restaurants do
    resources :reservations
  end

  resources :users, only: [:index, :new, :create]

  resources :sessions, only: [:new, :create, :destroy]
end
