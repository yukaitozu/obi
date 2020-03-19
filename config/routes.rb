Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
  root to: 'pages#dashboard', as: :authenticated_root
  end

  root "pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # namespace :dashboard do
  #   resources :listings, only: [:index]
  #   resources :bookings, only: [:index]
  # end

  get "/listings/:id/bookings/confirm", to: "bookings#confirm", as: :confirm_payment

  get "dashboard", to: "pages#dashboard"
  get "bookings/:id/approve", to: "bookings#approve", as: :approve
  get "bookings/:id/reject", to: "bookings#reject", as: :reject

  resources :listings do
    resources :bookings, only: [:new, :create]
  end

  resources :users, only: [:show,  :edit, :update]
  resources :bookings, only: [:index, :show]
end
