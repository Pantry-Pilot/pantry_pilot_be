require 'sidekiq/web'


Rails.application.routes.draw do
  #user registration and session enpoints
  post "/api/v1/register", to: "api/v1/users#create"
  post "/api/v1/login", to: "api/v1/sessions#create"
  get '/api/v1/recipes/search', to: 'api/v1/recipes#search'
  get 'api/v1/users/:id', to: 'api/v1/sessions#show'

  #User recipe endpoints
  get '/api/v1/recipes/:id', to: 'api/v1/recipes#show'
  post 'api/v1/add_recipe', to: 'api/v1/recipes#create'
  get '/api/v1/user_recipes/:user_id', to: 'api/v1/user_recipes#index'
  post '/api/v1/email_recipe', to: 'api/v1/emails#send_email_recipe'
  delete '/api/v1/delete_recipe', to: 'api/v1/user_recipes#destroy'

  #user add image enpoints
  post '/api/v1/add_image', to: 'api/v1/avatars#create'
  delete '/api/v1/delete_image', to: 'api/v1/avatars#destroy'
  #user login oauth enpoints
  get "/api/v1/auth/google_oauth2/callback", to: "api/v1/sessions#oauth"

  #user pantry/ingredients endpoints
  post "/api/v1/add_ingredient", to: "api/v1/user_ingredients#create"
  get "/api/v1/user_ingredients/:id", to: "api/v1/user_ingredients#index"
  get "/api/v1/expiring_user_ingredients/:id", to: "api/v1/user_ingredients#expiring_ingredients"
  delete "/api/v1/delete_ingredient/:ingredient_id", to: "api/v1/user_ingredients#destroy"

  mount Sidekiq::Web => '/sidekiq'
end
