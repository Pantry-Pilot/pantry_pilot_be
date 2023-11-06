class Api::V1::EmailsController < ApplicationController
  def email_recipe
    @recipe = Recipe.email_recipe(params[:recipe_id])
    @recipient = params[:recipient_email]
    render json: { success: "Email sent to #{@recipient}", status: 200}, status: 200
  end
end