class Api::V1::EmailsController < ApplicationController
  def send_email_recipe
    @recipe = Recipe.find_by(recipe_id: params[:recipe_id])
    recipe_id = params[:recipe_id]
    recipient_email = params[:recipient_email]
    sender_id = params[:sender_id]
    if @recipe
      RecipeSenderJob.perform_async(recipe_id, recipient_email, sender_id)
      render json: { success: "Email sent to #{@recipient}", status: 200}, status: 200
    else 
      render json: { error: "Email not sent", status: 400}, status: 400
    end 
  end
end