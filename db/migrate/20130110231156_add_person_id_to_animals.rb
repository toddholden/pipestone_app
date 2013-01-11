class AddPersonIdToAnimals < ActiveRecord::Migration
  def change
    add_column :animals, :person_id, :integer
  end
end
