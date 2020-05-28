class CreateRecommends < ActiveRecord::Migration[5.2]
  def change
    create_table :recommends do |t|
      t.integer :admin_id
      t.integer :product_id

      t.timestamps
    end
  end
end
