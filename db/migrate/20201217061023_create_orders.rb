class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :shipping
      t.integer :billing
      t.integer :payment_method
      t.string :name
      t.string :shipping_address
      t.integer :order_status
      t.string :shipping_postal_code

      t.timestamps
    end
  end
end
