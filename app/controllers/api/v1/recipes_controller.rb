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

  def create
    begin
    user = User.find(user_params[:user_id])
    recipe = Recipe.create(recipe_params)
    user_recipe= UserRecipe.create(user_id: user.id, recipe_id: recipe.id)
    # if !recipe.save
    #   render json: { error: "Recipe not saved!", status: 421 }, status: :unprocessable_entity
    # end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message, status: 404 }, status: :not_found
    end
  end

  private

  def recipe_params
    params.permit(:recipe_id, :title, :image, :summary, :instructions, :ingredients)
  end

  def user_params
    params.permit(:user_id)
  end
end
