class UserIngredientsSerializer
  include JSONAPI::Serializer
  attributes :name, :quantity, :exp_date
end