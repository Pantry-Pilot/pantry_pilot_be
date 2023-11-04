class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes, id: false do |t|
      t.primary_key :id, :integer, auto_increment: false
      t.string :title
      t.string :image
      t.string :summary
      t.string :instructions
      t.string :ingredients

      t.timestamps
    end
  end
end
