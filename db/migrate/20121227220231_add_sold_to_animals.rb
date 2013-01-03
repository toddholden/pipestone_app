class AddSoldToAnimals < ActiveRecord::Migration
  def change
    add_column :animals, :sold, :boolean, :default => false
  end
end
