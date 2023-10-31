Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post "/api/v1/register", to: "api/v1/users#create"

  post"/api/v1/login", to: "api/v1/sessions#create"
end
