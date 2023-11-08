class RecipeSenderJob
  include Sidekiq::Job

  def perform(recipe_id, recipient_email, sender_id)
    recipe = Recipe.email_recipe(recipe_id)
    sender = User.find(sender_id)
    RecipeMailer.email_recipe(recipe, recipient_email, sender).deliver_now
  end
end