Rails.application.routes.draw do
  post "/api/v1/register", to: "api/v1/users#create"
  post "/api/v1/login", to: "api/v1/sessions#create"

  get '/api/v1/recipes/search', to: 'api/v1/recipes#search'
  get '/api/v1/recipes/:id', to: 'api/v1/recipes#show'
end
