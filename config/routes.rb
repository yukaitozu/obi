Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # namespace :dashboard do
  #   resources :listings, only: [:index]
  #   resources :bookings, only: [:index]
  # end

  get "dashboard", to: "pages#dashboard"

  resources :listings do
    resources :bookings, only: [:new, :create]
  end

  resources :users, only: [:show, :edit, :update]
end
