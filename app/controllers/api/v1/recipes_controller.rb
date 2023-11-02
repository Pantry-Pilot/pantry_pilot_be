class Api::V1::RecipesController < ApplicationController
  def search
    begin
      recipes = RecipeFacade.search(params[:query])
      render json: RecipeSerializer.new(recipes)
    rescue StandardError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  def show
    begin
      recipe = RecipeFacade.find(params[:id])
      render json: RecipeSerializer.new(recipe)
    rescue StandardError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end
end
