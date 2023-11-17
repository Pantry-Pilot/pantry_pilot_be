class Api::V1::UserIngredientsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    ingredient = user.ingredients.create(ingredient_params)
    if ingredient.save
      render json: { notice: "Ingredient added succesfully", status: 204 }, status: 204
    else
      render json: {error: ingredient.errors.full_messages.to_sentence, status: 400}, status: 400 
    end 
  end

  def index
    user = User.find(params[:id])
    ingredients  = user.expiring_ingredients_asc

    if ingredients
      render json: {ingredients: UserIngredientsSerializer.new(ingredients)}, status: 200
    else 
      render json: "No ingredients found", status: 404
    end 

  end

  def destroy
    ingredient = Ingredient.find(params[:ingredient_id])
    ingredient.destroy
    if ingredient.destroyed?
      render json: { success: "Ingredient successfully removed", status: 204}
    else
      render json: { error: "Ingredient not deleted", status: 500}
    end
  end

  private

  def ingredient_params
    params.permit(:name, :quantity, :exp_date)
  end
end