class RecipeFacade
  def self.search(query)
    results = SpoonacularService.new.search_recipes(query)
    recipes = results[:results].map do |recipe_data|
      Recipe.new(recipe_data)
    end
  end

  def self.find(id)
    detailed_data = SpoonacularService.new.find_recipe(id)
    Recipe.new(detailed_data)
  end
end