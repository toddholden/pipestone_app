class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.date :date
      t.string :metal1
      t.string :allflex
      t.text :comments
      t.references :sale

      t.timestamps
    end
    add_index :animals, :sale_id
  end
end
