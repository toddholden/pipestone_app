class RemoveOwnerFromAnimals < ActiveRecord::Migration
  def up
    remove_column :animals, :owner
  end

  def down
    add_column :animals, :owner, :integer
  end
end
