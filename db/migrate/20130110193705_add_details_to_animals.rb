class AddDetailsToAnimals < ActiveRecord::Migration
  def change
    add_column :animals, :temperature, :string
    add_column :animals, :old_tag, :string
    add_column :animals, :months_pregnant, :string
    add_column :animals, :bruc, :string
    add_column :animals, :chv, :string
    add_column :animals, :owner, :integer
    add_column :animals, :breed, :string
    add_column :animals, :sex, :string
    add_column :animals, :age, :string
  end
end
