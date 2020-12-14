class AddAdiministrators < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :administrator, :boolean, default: false
  end
end
