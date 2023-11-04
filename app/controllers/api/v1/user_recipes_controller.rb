class Api::V1::UserRecipesController < ApplicationController
  def index 
    user = User.find(params[:user_id])
    render json: UserRecipesSerializer.new(user.recipes)
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
  end
end