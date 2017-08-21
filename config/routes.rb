Rails.application.routes.draw do
  root to: 'pages#home'
  resources :instruments, only: [:index, :new, :create, :show]
end
