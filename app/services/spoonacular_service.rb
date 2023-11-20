class SpoonacularService
  def search_recipes(recipe_filters)
    response = conn.get("/recipes/complexSearch") do |req|
      if recipe_filters[:query].present?
        req.params['query'] = recipe_filters[:query]
      end
      if recipe_filters[:diet].present?
        req.params['diet'] = recipe_filters[:diet]
      end
      if recipe_filters[:intolerances].present?
        req.params['intolerances'] = recipe_filters[:intolerances]
      end
      if recipe_filters[:includeIngredients].present?
        req.params['includeIngredients'] = recipe_filters[:includeIngredients]
      end
      if recipe_filters[:excludeIngredients].present?
        req.params['excludeIngredients'] = recipe_filters[:excludeIngredients]
      end
    end
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def find_recipe(id)
    response = conn.get("/recipes/#{id}/information")

    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: "https://api.spoonacular.com") do |f|
      f.headers['Content-Type'] = 'application/json'
      f.params['apiKey'] = Rails.application.credentials.spoonacular[:key]
    end
  end
end