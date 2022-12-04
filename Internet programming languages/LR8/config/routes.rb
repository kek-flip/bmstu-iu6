Rails.application.routes.draw do
  root 'lucky_nums#input'
  get 'lucky_nums', to: 'lucky_nums#view'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
