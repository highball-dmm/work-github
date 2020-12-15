class CreateShippingAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :shipping_addresses do |t|
      t.integer :customer_id
      t.string :postcode
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end
