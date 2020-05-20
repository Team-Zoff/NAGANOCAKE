class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.string :product_name
      t.text :description
      t.string :product_image_id
      t.integer :price_excluding_tax
      t.integer :sale_status

      t.timestamps
    end
  end
end
