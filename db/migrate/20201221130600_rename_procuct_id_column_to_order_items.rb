class RenameProcuctIdColumnToOrderItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :order_items, :procuct_id, :product_id
  end
end
