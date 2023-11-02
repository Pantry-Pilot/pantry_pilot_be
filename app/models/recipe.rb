class Recipe
  attr_reader :id, :title, :image, :summary, :ingredients, :instructions

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @image = attributes[:image]
    @summary = attributes[:summary] || ""
    @instructions = attributes[:instructions] || ""
    @ingredients = attributes[:extendedIngredients] ? map_ingredients(attributes[:extendedIngredients]) : []
  end

  private

  def map_ingredients(ingredients_data)
    ingredients_data.map do |ingredient_data|
      Ingredient.new(ingredient_data)
    end
  end
end