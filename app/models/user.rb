class User < ApplicationRecord
  has_many :user_recipes, dependent: :destroy
  has_many :recipes, through: :user_recipes
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_secure_password
end
