class Api::V1::UserRecipesController < ApplicationController
  def index 
    user = User.find(params[:user_id])
    avatar_urls = user.recipes.map do |recipe|
      url_for(recipe.avatar) if recipe.avatar.attached?
    end
    render json: { recipes: UserRecipesSerializer.new(user.recipes), avatar_urls: avatar_urls }
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