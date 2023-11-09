class Api::V1::AvatarsController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe][:id])
    avatar = params[:recipe][:avatar]

    recipe.avatar.attach(avatar)
    
    if recipe.avatar.attached?
      render json: { notice: "Image uploaded succesfully", status: 200 }
    else
      render json: { error: recipe.errors.full_messages.to_sentence, status: 400 }
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])

    if recipe.avatar.attached?
      recipe.avatar.purge
      render json: { notice: "Image deleted succesfully", status: 200 }
    else
      render json: { error: recipe.errors.full_messages.to_sentence, status: 400 }
    end
  end
end