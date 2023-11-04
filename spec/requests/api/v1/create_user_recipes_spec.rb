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
      expect(UserRecipe.count).to eq(1)
     
    end
    it "returns an error if the user recipe is not created du to user id not found" do
      User.create!(id: 1, name: "Nick", email: "nick@nick.com", password: "nickspassword")
      
      post "/api/v1/add_recipe", params: { user_id: "2", recipe_id: "123456", title: "Chicken 65", image: "chicken_image.jpg", summary: "Chicken 65 is good", instructions: "make chicken 65 times", ingredients: "chicken, goodness" }
      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end
  end
end