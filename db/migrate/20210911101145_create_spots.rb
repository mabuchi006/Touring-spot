class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.references :genre_id, null: false
      t.string :name,         null: false
      t.string :image_id,     null: false
      t.text :introduction,   null: false
      t.integer :price,       null: false
      t.boolean :is_active,   null: false
      t.integer :spots, :genre_id_id, :genre_id

      t.timestamps


    end
  end
end
