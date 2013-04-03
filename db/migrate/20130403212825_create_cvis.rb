class CreateCvis < ActiveRecord::Migration
  def change
    create_table :cvis do |t|
      t.string :cvi_number
      t.date :date
      t.integer :person_id

      t.timestamps
    end
  end
end
