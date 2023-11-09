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
To set up this backend application locally, you will need to run both the backend and the frontend applications. Run `rails s` to start the server.  The front end uses https://localhost:3000 to access this server on https://localhost:5000. Also run `redis-server` and `bundle exec sidekiq` on back end servers to allow the background workers to run.

## Schema
```
ActiveRecord::Schema[7.0].define(version: 2023_11_06_154607) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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
    t.string "provider"
    t.string "uid"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "user_recipes", "recipes"
  add_foreign_key "user_recipes", "users"
end
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

## Example Resquest Reponse
Request
```
#<ActionDispatch::Request GET "http://localhost:5000/api/v1/recipes/637876" for ::1>
```
Response
```
#<RecipeSerializer:0x000000011ec1ae70
 @fieldsets={},
 @params={},
 @resource=
  #<ApiRecipe:0x000000011d8f7690
   @id=637876,
   @image="https://spoonacular.com/recipeImages/637876-556x370.jpg",
   @ingredients=
    [{:id=>5062,
      :aisle=>"Meat",
      :image=>"chicken-breasts.png",
      :consistency=>"SOLID",
      :name=>"chicken breast",
      :nameClean=>"chicken breast",
      :original=>"500 grams boneless chicken breast",
      :originalName=>"boneless chicken breast",
      :amount=>500.0,
      :unit=>"grams",
      :meta=>["boneless"],
      :measures=>
       {:us=>{:amount=>1.102, :unitShort=>"lb", :unitLong=>"pounds"},
        :metric=>
         {:amount=>500.0, :unitShort=>"g", :unitLong=>"grams"}}},
     {:id=>2009,
      :aisle=>"Spices and Seasonings",
      :image=>"chili-powder.jpg",
      :consistency=>"SOLID",
      :name=>"chili powder",
      :nameClean=>"chili powder",
      :original=>"2-3 tsp chili powder",
      :originalName=>"chili powder",
      :amount=>2.0,
      :unit=>"tsp",
      :meta=>[],
      :measures=>
       {:us=>
         {:amount=>2.0, :unitShort=>"tsps", :unitLong=>"teaspoons"},
        :metric=>
         {:amount=>2.0, :unitShort=>"tsps", :unitLong=>"teaspoons"}}},
     {:id=>10111215,
      :aisle=>"Produce",
      :image=>"garlic-paste.png",
      :consistency=>"SOLID",
      :name=>"ginger and garlic paste",
      :nameClean=>"garlic paste",
      :original=>"4 tbsp Ginger and Garlic paste",
      :originalName=>"Ginger and Garlic paste",
      :amount=>4.0,
      :unit=>"tbsp",
      :meta=>[],
      :measures=>
       {:us=>{:amount=>4.0, :unitShort=>"Tbsps", :unitLong=>"Tbsps"},
        :metric=>
         {:amount=>4.0, :unitShort=>"Tbsps", :unitLong=>"Tbsps"}}},
     {:id=>2047,
      :aisle=>"Spices and Seasonings",
      :image=>"salt.jpg",
      :consistency=>"SOLID",
      :name=>"salt",
      :nameClean=>"table salt",
      :original=>"½ tbsp. salt",
      :originalName=>"salt",
      :amount=>0.5,
      :unit=>"tbsp",
      :meta=>[],
      :measures=>
       {:us=>{:amount=>0.5, :unitShort=>"Tbsps", :unitLong=>"Tbsps"},
        :metric=>
         {:amount=>0.5, :unitShort=>"Tbsps", :unitLong=>"Tbsps"}}},
     {:id=>2043,
      :aisle=>"Spices and Seasonings",
      :image=>"turmeric.jpg",
      :consistency=>"SOLID",
      :name=>"turmeric powder",
      :nameClean=>"turmeric",
      :original=>"1/4 tsp Turmeric powder",
      :originalName=>"Turmeric powder",
      :amount=>0.25,
      :unit=>"tsp",
      :meta=>[],
      :measures=>
       {:us=>
         {:amount=>0.25, :unitShort=>"tsps", :unitLong=>"teaspoons"},
        :metric=>
         {:amount=>0.25, :unitShort=>"tsps", :unitLong=>"teaspoons"}}},
     {:id=>1116,
      :aisle=>"Milk, Eggs, Other Dairy",
      :image=>"plain-yogurt.jpg",
      :consistency=>"SOLID",
      :name=>"yogurt",
      :nameClean=>"yogurt",
      :original=>"4 tbsp yogurt",
      :originalName=>"yogurt",
      :amount=>4.0,
      :unit=>"tbsp",
      :meta=>[],
      :measures=>
       {:us=>{:amount=>4.0, :unitShort=>"Tbsps", :unitLong=>"Tbsps"},
        :metric=>
         {:amount=>4.0, :unitShort=>"Tbsps", :unitLong=>"Tbsps"}}}],
   @instructions=
    "<ol><li>Take a large bowl mix in the ginger and garlic paste, yogurt, red chilly powder, turmeric powder, and salt.</li><li>Mix well to from smooth and thick paste, add the chicken pieces to the masala paste and  marinaded for 4 hours.</li><li>Heat enough oil in a pan to deep fry the marinaded chicken pieces. Deep fry the chicken pieces in batches till crisp and golden color.</li><li>Note: The taste of the Chicken 65 depends mainly on the amount of time it gets marinated in the masala, it is best to marinate the chicken pieces the day before.</li></ol>",
   @summary=
    "Chicken 65 could be just the <b>gluten free</b> recipe you've been looking for. This hor d'oeuvre has <b>121 calories</b>, <b>19g of protein</b>, and <b>3g of fat</b> per serving. For <b>$1.15 per serving</b>, this recipe <b>covers 11%</b> of your daily requirements of vitamins and minerals. This recipe serves 6. Head to the store and pick up salt, chili powder, yogurt, and a few other things to make it today. 6 people have made this recipe and would make it again. It is brought to you by Foodista. From preparation to the plate, this recipe takes approximately <b>45 minutes</b>. Overall, this recipe earns a <b>not so spectacular spoonacular score of 39%</b>. Similar recipes are <a href=\"https://spoonacular.com/recipes/i-aint-chicken-chicken-crispy-roasted-chicken-breasts-with-orange-and-cardamom-1243251\">I Ain't Chicken Chicken: Crispy Roasted Chicken Breasts with Orange and Cardamom</a>, <a href=\"https://spoonacular.com/recipes/i-aint-chicken-chicken-crispy-roasted-chicken-breasts-with-orange-and-cardamom-1230059\">I Ain't Chicken Chicken: Crispy Roasted 
Chicken Breasts with Orange and Cardamom</a>, and <a href=\"https://spoonacular.com/recipes/i-aint-chicken-chicken-crispy-roasted-chicken-breasts-with-orange-and-cardamom-1224321\">I Ain't Chicken Chicken: Crispy Roasted Chicken Breasts with Orange and Cardamom</a>.",
   @title="Chicken 65">>
```

## Testing
Run `bundle exec rspec` to run our entire test suite.  Make sure you're running both the redis and sidekiq servers as detailed above.

## Contributors
- [Antoine Aube](https://www.linkedin.com/in/antoineaube/)                - GitHub: [@Antoine-Abube](https://github.com/Antoine-Aube)
- [Jorja Flemming](https://www.linkedin.com/in/jorjaf/)                   - GitHub: [@jorjaf](https://github.com/jorjaf)
- [Lane Bretschneider](https://www.linkedin.com/in/lanebretschneider/)    - GitHub: [@lanebret85](https://github.com/lanebret85)
- [Will Chen](https://www.linkedin.com/in/williamfchen/)                  - GitHub: [@williamfchen](https://github.com/williamfchen)