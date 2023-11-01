class Api::V1::RecipesController < ApplicationController
  def search
    results = SpoonacularService.new.search_recipes(params[:query])
    recipes = results[:results].map do |recipe_data|
      Recipe.new(recipe_data)
    end
    render json: RecipeSerializer.new(recipes)
  end
end
