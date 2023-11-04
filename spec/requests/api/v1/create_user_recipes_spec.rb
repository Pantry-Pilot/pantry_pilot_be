require 'rails_helper'

RSpec.describe "Create A User Recipe endpoint" do
  describe "creating user recipes using '/add_recipe' endpoint" do
    it "can create a user recipe in the database" do
      User.create!(id: 1, name: "Nick", email: "nick@nick.com", password: "nickspassword")

      post "/api/v1/add_recipe", params: { user_id: "1", recipe_id: "123456", title: "Chicken 65", image: "chicken_image.jpg", summary: "Chicken 65 is good", instructions: "make chicken 65 times", ingredients: "chicken, goodness" }

      expect(response).to be_successful
      expect(response.status).to eq(204)

      expect(Recipe.last.recipe_id).to eq("123456")
      expect(Recipe.last.title).to eq("Chicken 65")
      expect(Recipe.last.image).to eq("chicken_image.jpg")
      expect(Recipe.last.summary).to eq("Chicken 65 is good")
      expect(Recipe.last.instructions).to eq("make chicken 65 times")
      expect(Recipe.last.ingredients).to eq("chicken, goodness")
      expect(Recipe.count).to eq(1)
      expect(UserRecipe.last.user_id).to eq(1)
      # expect(UserRecipe.last.recipe_id).to eq(1)
      expect(UserRecipe.count).to eq(1)
      
      # response_body = JSON.parse(response.body, symbolize_names: true)

      # expect(response_body[:data]).to be_a(Hash)

      # expect(response_body[:data]).to have_key(:id)
      # expect(response_body[:data][:id]).to eq(UserRecipe.last.id.to_s)
    
      # expect(response_body[:data]).to have_key(:type)
      # expect(response_body[:data][:type]).to eq("user_recipe")

      # expect(response_body[:data]).to have_key(:attributes)
      # expect(response_body[:data][:attributes]).to be_a(Hash)

      # expect(response_body[:data][:attributes]).to have_key(:user_id)
      # expect(response_body[:data][:attributes][:user_id]).to eq(UserRecipe.last.user_id)

      # expect(response_body[:data][:attributes]).to have_key(:recipe_id)
      # expect(response_body[:data][:attributes][:recipe_id]).to eq(UserRecipe.last.recipe_id)
      # expect(response_body[:data][:attributes][:recipe_id]).to eq(Recipe.last.id)

      # expect(response_body[:data][:attributes]).to have_key(:title)
      # expect(response_body[:data][:attributes][:title]).to eq(Recipe.last.title)

      # expect(response_body[:data][:attributes]).to have_key(:image)
      # expect(response_body[:data][:attributes][:image]).to eq(Recipe.last.image)

      # expect(response_body[:data][:attributes]).to have_key(:summary)
      # expect(response_body[:data][:attributes][:summary]).to eq(Recipe.last.summary)

      # expect(response_body[:data][:attributes]).to have_key(:instructions)
      # expect(response_body[:data][:attributes][:instructions]).to eq(Recipe.last.instructions)

      # expect(response_body[:data][:attributes]).to have_key(:ingredients)
      # expect(response_body[:data][:attributes][:ingredients]).to eq(Recipe.last.ingredients)
    end
  end
end