Rails.application.routes.draw do

  root 'restaurants#index'

  resources :restaurants do
    resources :reservations, only: [:create, :show]
  end

  resources :users, only: [:index, :new, :create]

  resources :sessions, only: [:new, :create, :destroy]
end
