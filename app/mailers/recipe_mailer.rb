class RecipeMailer < ApplicationMailer
  def email_recipe(recipe, recipient, sender)
    @recipe = recipe
    @recipient = recipient
    @ingredients = recipe.parsed_ingredients
    @sender = sender
    mail(to: @recipient, subject: "Check out this recipe!")
  end
end