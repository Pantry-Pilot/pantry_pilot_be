require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'initialize' do
    it 'sets the id, title, and image attributes' do
      recipe = Recipe.new(id: 1, title: 'Pancakes', image: 'pancakes.jpg')
      expect(recipe.id).to eq(1)
      expect(recipe.title).to eq('Pancakes')
      expect(recipe.image).to eq('pancakes.jpg')
    end
  end
end
