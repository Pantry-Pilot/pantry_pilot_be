require 'rails_helper'

RSpec.describe "Send Recipes for a User endpoint" do
  describe "create user_recipes endpoint" do
    it "can create an endpoint to serve user recipes to the frontend" do
      user = User.create!(id: 1, name: "Nick", email: "nick@nick.com", password: "password") 
      recipe = Recipe.create(id: 1, recipe_id: "123456", title: "Chicken 65", image: "chicken_image.jpg", summary: "Chicken 65 is good", instructions: "make chicken 65 times", ingredients: "chicken, goodness")
      recipe2 = Recipe.create(id: 2, recipe_id: "123457", title: "Chicken 66", image: "chicken_image2.jpg", summary: "Chicken 66 is good", instructions: "make chicken 66 times", ingredients: "chicken, goodness")
      user_recipe = UserRecipe.create!(user_id: 1, recipe_id: 1)
      user_recipe2 = UserRecipe.create!(user_id: 1, recipe_id: 2)
      get "/api/v1/user_recipes/#{user.id}", params: {user_id: 1}

      expect(response).to be_successful
      expect(response.status).to eq(200)

      response_body = JSON.parse(response.body, symbolize_names: true)
    end
  end
end