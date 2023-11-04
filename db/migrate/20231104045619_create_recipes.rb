class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :recipe_id
      t.string :title
      t.string :image
      t.string :summary
      t.string :instructions
      t.string :ingredients

      t.timestamps
    end
  end
end
