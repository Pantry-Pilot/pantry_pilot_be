# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all

test_user = User.create(name: "test", email: "test@test.com", password: "1234")

ingredient_1 = test_user.ingredients.create(name: "Broccoli", quantity: "1", exp_date: "2023-12-10")
ingredient_2 = test_user.ingredients.create(name: "Mushrooms", quantity: "1", exp_date: "2021-12-11")
ingredient_3 = test_user.ingredients.create(name: "Cheddar Cheese", quantity: "1", exp_date: "2023-12-12")