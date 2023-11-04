require "rails_helper"

RSpec.describe Recipe, type: :model do
  describe "relationships" do
    it { should have_many :user_recipes }
    it { should have_many(:users).through(:user_recipes) }
  end

  describe "validations" do
    it { should validate_presence_of :id }
  end

  describe 'initialize' do
    it 'sets the id, title, image, summary, instructions, and ingredients attributes' do
      recipe = Recipe.create!(id: 1, title: 'Pancakes', image: 'pancakes.jpg', summary: "it's pancakes", instructions: "pour batter, flip", ingredients: "flour, eggs, milk")
      expect(recipe.id).to eq(1)
      expect(recipe.title).to eq('Pancakes')
      expect(recipe.image).to eq('pancakes.jpg')
      expect(recipe.summary).to eq("it's pancakes")
      expect(recipe.instructions).to eq("pour batter, flip")
      expect(recipe.ingredients).to eq("flour, eggs, milk")
    end
  end
end