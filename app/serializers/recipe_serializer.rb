class RecipeSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :image
end
