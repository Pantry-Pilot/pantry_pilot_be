class RecipeMailer < ApplicationMailer
  def email_recipe(recipe, recipient, sender)
    @recipe = recipe
    @recipient = recipient
    require 'pry';binding.pry
    @ingredients = recipe.parsed_ingredients
    @sender = User.find(sender.id)
    mail(to: @recipient, subject: "Check out this recipe!")
  end
end