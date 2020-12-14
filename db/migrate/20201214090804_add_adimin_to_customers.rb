class AddAdiminToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :costomers, :admin, :boolean, default: false
  end
end
