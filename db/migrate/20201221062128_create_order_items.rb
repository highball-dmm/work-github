class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :procuct_id
      t.integer :customer_id
      t.integer :item_quantity
      t.integer :production_status
      t.integer :purchase_price_intax

      t.timestamps
    end
  end
end
