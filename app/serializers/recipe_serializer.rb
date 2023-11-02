class RecipeSerializer
  include JSONAPI::Serializer
  attributes :title, :image
end
