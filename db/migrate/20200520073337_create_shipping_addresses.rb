class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.integer :member_id
      t.string :address_name
      t.string :postal_code
      t.string :address

      t.timestamps
    end
  end
end
