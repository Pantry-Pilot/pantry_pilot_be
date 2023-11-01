class SpoonacularService
  def search_recipes(query)
    response = conn.get("/recipes/complexSearch") do |req|
      req.params['query'] = query
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: "https://api.spoonacular.com") do |f|
      f.params['apiKey'] = Rails.application.credentials.spoonacular[:key]
      f.headers['Content-Type'] = 'application/json'
    end
  end
end