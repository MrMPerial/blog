Rails.application.routes.draw do
  root 'posts#index'
  get 'pages/home'
  get 'dashboards/index', as: :dashboards
  resources :logins, only: %i[new create]
  resources :registrations, only: %i[new create]
  resources :posts
end
