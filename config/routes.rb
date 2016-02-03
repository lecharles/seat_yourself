Rails.application.routes.draw do

  root 'restaurants#index'

  resources :restaurants, only: [:index, :show] do
    resources :reservations, only: [:create, :show]
  end

end
