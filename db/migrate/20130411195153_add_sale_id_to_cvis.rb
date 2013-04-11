class AddSaleIdToCvis < ActiveRecord::Migration
  def change
    add_column :cvis, :sale_id, :integer
  end
end
