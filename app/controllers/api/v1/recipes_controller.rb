class Api::V1::RecipesController < ApplicationController
  def search
    recipes = RecipeFacade.search(params[:query])
    if !recipes.empty? 
      render json: RecipeSerializer.new(recipes)
    else 
      render json: { error: "No recipes match those key words", status: 421 }, status: :unprocessable_entity
    end
  end

  def show
    begin
      recipe = RecipeFacade.find(params[:id])
      render json: RecipeSerializer.new(recipe)
    rescue StandardError => e
      render json: { error: "Recipe not found!", status: 421 }, status: :unprocessable_entity
    end
  end
end
