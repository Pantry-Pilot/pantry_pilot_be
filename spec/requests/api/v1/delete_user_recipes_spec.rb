require 'rails_helper'

RSpec.describe "Delete A User Recipe endpoint" do
  describe "deleting user recipes using '/delete_recipe' endpoint" do
    it "can delete a user recipe in the database" do
      user = User.create!(id: 1, name: "Nick", email: "nick@nick.com", password: "nickspassword")
      recipe = Recipe.create!(id: 1, recipe_id: "123456", title: "Chicken 65", image: "chicken_image.jpg", summary: "Chicken 65 is good", instructions: "make chicken 65 times", ingredients: "chicken, goodness")
      UserRecipe.create!(user_id: user.id, recipe_id: recipe.id)

      expect(UserRecipe.count).to eq(1)
      expect(Recipe.count).to eq(1)

      delete "/api/v1/delete_recipe", params: { id: "1" }

      expect(response).to be_successful
      expect(response.status).to eq(204)

      expect(UserRecipe.count).to eq(0)
      expect(Recipe.count).to eq(0)
    end
  end
end