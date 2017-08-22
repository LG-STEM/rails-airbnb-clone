Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :instruments, only: [:index, :new, :create, :show]
  resources :instruments do
  resources :bookings, only: [:create]
  end
end
