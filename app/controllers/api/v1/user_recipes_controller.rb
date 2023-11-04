class Api::V1::UserRecipesController < ApplicationController
  def index 
    user = User.find(params[:user_id])
    render json: UserRecipesSerializer.new(user.recipes)
  end
end