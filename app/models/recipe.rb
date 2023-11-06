class Recipe < ApplicationRecord
  has_many :user_recipes, dependent: :destroy
  has_many :users, through: :user_recipes

  validates :recipe_id, presence: true

  def self.email_recipe(recipe_id)
    Recipe.where("recipe_id = ?", recipe_id).first
  end
end