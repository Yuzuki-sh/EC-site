class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id,  null: false
      t.string :name,       null: false
      t.text :description,  null: false
      t.string :image_id
      t.boolean :is_active, null: false, default: TRUE
      t.integer :price,     null: false

      t.timestamps
    end
  end
end
