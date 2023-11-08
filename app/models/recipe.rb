class Recipe < ApplicationRecord
  has_many :user_recipes, dependent: :destroy
  has_many :users, through: :user_recipes

  validates :recipe_id, presence: true

  has_one_attached :avatar, service: :amazon
  
  serialize :ingredients, JSON

  def self.email_recipe(recipe_id)
    Recipe.where("recipe_id = ?", recipe_id).first
  end

  def parsed_ingredients
    ingredient_strings = self.ingredients.split('] [')

    ingredient_strings.map do |ingredient_str|
      name, amount, unit = ingredient_str.gsub(/\A\[|\]\z/, '').split(', ', 3)
      amount = amount.to_f if amount
      { name: name, amount: amount, unit: unit }
    end
  end

end