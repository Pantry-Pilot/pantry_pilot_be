class Recipe
  attr_reader :id, :title, :image

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @image = attributes[:image]
  end
end