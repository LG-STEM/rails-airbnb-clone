Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :instruments, only: [:index, :new, :create, :show]
  mount Attachinary::Engine => "/attachinary"
end
