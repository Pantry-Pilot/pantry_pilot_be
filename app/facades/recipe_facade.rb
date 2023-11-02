class RecipeFacade
  def self.search(query)
    results = SpoonacularService.new.search_recipes(params[:query])
    recipes = results[:results].map do |recipe_data|
      Recipe.new(recipe_data)
    end
  end
end
