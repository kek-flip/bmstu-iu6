Rails.application.routes.draw do
  get 'sessions/login'
  post 'sessions/create'
  get 'sessions/logout'
  get 'view', to: 'lucky_nums#view'
  resources :users, only: %i[ new create ]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "lucky_nums#input"
end
