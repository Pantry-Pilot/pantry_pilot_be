class User < ApplicationRecord
  has_many :user_recipes, dependent: :destroy
  has_many :recipes, through: :user_recipes
  has_many :ingredients, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_secure_password

  def expiring_ingredients_asc
    ingredients.order(exp_date: :asc)
  end
end
