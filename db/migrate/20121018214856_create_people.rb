class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :lastname
      t.string :firstname
      t.string :address
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
