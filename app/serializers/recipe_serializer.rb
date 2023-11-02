class RecipeSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :image, :summary, :instructions, :ingredients
end
