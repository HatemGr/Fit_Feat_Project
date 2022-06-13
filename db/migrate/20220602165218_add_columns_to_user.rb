class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :description, :text
    add_column :users, :birthdate, :datetime
    add_column :users, :address, :string 
    add_column :users, :longitude, :float
    add_column :users, :latitude, :float
    add_reference :users, :city, index: true
  end
end
