class RecipeMailer < ApplicationMailer
  def email_recipe(recipe, recipient, sender)
    @recipe = recipe
    @recipient = recipient
    @sender = User.find(sender.id)
    mail(to: @recipient, subject: "Check out this recipe!")
  end
end