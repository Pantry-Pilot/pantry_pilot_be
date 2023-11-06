class Api::V1::UserRecipesController < ApplicationController
  def index 
    user = User.find(params[:user_id])
    render json: UserRecipesSerializer.new(user.recipes)
  end

  def destroy
    recipe = Recipe.find(params[:id])
    if recipe.destroy
      render json: { status: 204, notice: "Recipe successfully removed" }
    else
      render json: { status: 500, error: "Recipe not deleted" }
    end
  end
end