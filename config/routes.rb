Rails.application.routes.draw do

  resources :restaurants, only: [:index, :show] do
    resources :reservations, only: [:create, :show]
  end

  resources :users, only: [:index, :new, :create]

  resources :sessions, only: [:new, :create, :destroy]
end
