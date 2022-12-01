Rails.application.routes.draw do
  
  root "logins#new"
  
  resources :registrations, only: %i[new create]
  resources :logins,        only: %i[new create]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
