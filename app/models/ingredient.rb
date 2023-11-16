class Ingredient < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :quantity, presence: true
  validates :exp_date, presence: true

end