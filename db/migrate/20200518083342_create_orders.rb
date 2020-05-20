class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :confirmed_purchase_price
      t.integer :order_status
      t.integer :shipping_free
      t.string :address
      t.string :postal_code
      t.integer :method_of_payment
      t.integer :member_id
      t.string :address_name

      t.timestamps
    end
  end
end
