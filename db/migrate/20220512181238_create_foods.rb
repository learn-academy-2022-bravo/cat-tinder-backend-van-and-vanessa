class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :dishname
      t.string :genre
      t.string :category
      t.text :image

      t.timestamps
    end
  end
end
