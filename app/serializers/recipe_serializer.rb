class RecipeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :image, :summary, :instructions, :ingredients
end
