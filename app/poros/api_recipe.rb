class ApiRecipe
  attr_reader :id, :title, :image, :summary, :instructions, :ingredients

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @image = attributes[:image]
    @summary = attributes[:summary] || ""
    @instructions = attributes[:instructions] || ""
    @ingredients = attributes[:extendedIngredients] || []
  end
end
