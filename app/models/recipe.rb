class Recipe < ApplicationRecord
  has_many :user_recipes, dependent: :destroy
  has_many :users, through: :user_recipes

  validates :recipe_id, presence: true

  has_one_attached :image
end