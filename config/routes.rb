Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :instruments, only: [:index, :new, :create, :show] do
    resources :reviews, only: [:new, :create]
    resources :bookings, only: [:create]
  end
  mount Attachinary::Engine => "/attachinary"
end
