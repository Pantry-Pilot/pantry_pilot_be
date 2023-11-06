class Api::V1::EmailsController < ApplicationController
  def send_email_recipe
    @recipe = Recipe.email_recipe(params[:recipe_id])
    @recipient = params[:recipient_email]
    @sender = User.find(params[:sender_id])
    # require 'pry';binding.pry
    render json: { success: "Email sent to #{@recipient}", status: 200}, status: 200
    if @recipe
      RecipeMailer.email_recipe(@recipe, @recipient, @sender).deliver_now
    end 
  end
end