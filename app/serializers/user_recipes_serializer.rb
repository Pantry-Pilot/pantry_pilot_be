class UserRecipesSerializer
  include JSONAPI::Serializer
  attributes :recipe_id, :title, :image

end