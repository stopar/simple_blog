Rails.application.routes.draw do
  
  root "posts#index"
  get 'logout',   to: 'logins#destroy',  as: 'logout'

  resources :registrations, only: %i[new create]
  resources :posts
  resources :logins,        only: %i[new create destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
