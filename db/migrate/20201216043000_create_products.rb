class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.string :name
      t.text :products_explanation
      t.integer :non_taxed_price
      t.boolean :sale_status
      t.string :products_image_id

      t.timestamps
    end
  end
end
