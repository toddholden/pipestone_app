class AddZipcodeToPeople < ActiveRecord::Migration
  def change
    add_column :people, :zipcode, :string
  end
end
