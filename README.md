# Pantry Pilot README

## About this Project
Pantry Pilot is an application that allows users to search for and save meal recipes based on simple ingredients found in their pantries.

Find our website here: https://pantrypilot-bb63e22bf516.herokuapp.com/

## Purpose of pantry_pilot_be
This Ruby backend application is designed to interact with the Spoonacular API and our front end app - pantry_pilot_fe. It serializes the JSON responses for our frontend client, manages user and recipe data, and handles image storage on AWS S3. Furthermore, it processes background jobs and utilizes Action Mailer for email sharing functionalities.

## Features
- **Spoonacular API Integration**: Communicates with the Spoonacular API, fetching and serializing data.
- **User and Recipe Management**: Provides endpoints for user and recipe CRUD operations.
- **AWS S3 Integration**: Manages image uploads and storage.
- **Background Workers**: Leverages background processing for non-blocking tasks.
- **Action Mailer**: Facilitates sharing recipes through email.

### Technology
<img src="https://mikewilliamson.files.wordpress.com/2010/05/rails_on_ruby.jpg" alt="drawing" width="75"/>
<img src="https://logowik.com/content/uploads/images/circleci8026.jpg" alt="drawing" width="100"/>
<img src="https://www.loginradius.com/blog/static/a9dad0fc4bf1af95243aa5e2d017bc22/a8669/google_cover.jpg" alt="drawing" width="100"/>
<img src="https://www.logo.wine/a/logo/Redis/Redis-Logo.wine.svg" alt="drawing" width="100"/>
<img src="https://media.licdn.com/dms/image/D4E12AQHm9dDtv5rBBw/article-cover_image-shrink_423_752/0/1661430629065?e=1704931200&v=beta&t=lY1QnNdVsmfW9wBOz6z0VgEqoej23aS_lnN9XIPwzIU" alt="drawing" width="200"/>

- Ruby v7.0
- Bundler
- PostgreSQL
- Redis
- AWS S3
- Spoonacular API Key
- JSONAPI Serializer
- CircleCI
- Faraday
- bcyrpt
- sidekiq
- ActionMailer
- ActionStorage

## Testing
- VCR
- WebMock
- SimpleCov
- RSpec
- Capybara
- Launchy
- Orderly
- ShouldaMatchers

## Getting Started
To set up this backend application locally, you will need to run both the backend and the frontend applications. Run `rails s` to start the server.  The front end uses https://localhost:3000 to access this server on https://localhost:5000. 

## Schema
```
create_table "recipes", force: :cascade do |t|
    t.string "recipe_id"
    t.string "title"
    t.string "image"
    t.string "summary"
    t.string "instructions"
    t.string "ingredients"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_recipes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "recipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_user_recipes_on_recipe_id"
    t.index ["user_id"], name: "index_user_recipes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "user_recipes", "recipes"
  add_foreign_key "user_recipes", "users"
  ```

## Endpoints
```
post "/api/v1/register", to: "api/v1/users#create"
post "/api/v1/login", to: "api/v1/sessions#create"
get 'api/v1/users/:id', to: 'api/v1/sessions#show'
get '/api/v1/user_recipes/:user_id', to: 'api/v1/user_recipes#index'
get '/api/v1/recipes/search', to: 'api/v1/recipes#search'
get '/api/v1/recipes/:id', to: 'api/v1/recipes#show'
post 'api/v1/add_recipe', to: 'api/v1/recipes#create'
post '/api/v1/email_recipe', to: 'api/v1/emails#send_email_recipe'
delete '/api/v1/delete_recipe', to: 'api/v1/user_recipes#destroy'
get "/api/v1/auth/google_oauth2/callback", to: "api/v1/sessions#oauth"
post '/api/v1/add_image', to: 'api/v1/avatars#create'
delete '/api/v1/delete_image', to: 'api/v1/avatars#destroy'
``` 

## Testing
Run `bundle exec rspec` to run our entire test suite.

## Contributors
- [Antoine Aube](https://www.linkedin.com/in/antoineaube/)                - GitHub: [@Antoine-Abube](https://github.com/Antoine-Aube)
- [Jorja Flemming](https://www.linkedin.com/in/jorjaf/)                   - GitHub: [@jorjaf](https://github.com/jorjaf)
- [Lane Bretschneider](https://www.linkedin.com/in/lanebretschneider/)    - GitHub: [@lanebret85](https://github.com/lanebret85)
- [Will Chen](https://www.linkedin.com/in/williamfchen/)                  - GitHub: [@williamfchen](https://github.com/williamfchen)