Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :users do
    resources :listings, only: [:index]
    resources :bookings, only: [:index]
  end

  resources :listings do
    resources :bookings, only: [:new, :create]
  end

  resources :users, only: [:show]
end
