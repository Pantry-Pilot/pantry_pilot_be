class Ingredient
  attr_reader :id, :name, :amount, :unit

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @amount = attributes[:amount]
    @unit = attributes[:unit]
  end
end
