class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :buyer_number
      t.date :sale_date
      t.references :person

      t.timestamps
    end
  end
end
