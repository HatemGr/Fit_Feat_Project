class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :description, :text
    add_column :users, :birthdate, :datetime
    add_column :users, :longitude, :float
    add_column :users, :latitude, :float
    add_reference :users, :city, index: true
    add_column :users, :tennis_frequency, :integer
    add_column :users, :workout_frequency, :integer
    add_column :users, :running_frequency, :integer
    add_column :users, :climbing_frequency, :integer
    add_column :users, :futsal_frequency, :integer
    add_column :users, :tennis_experience, :integer
    add_column :users, :workout_experience, :integer
    add_column :users, :running_experience, :integer
    add_column :users, :climbing_experience, :integer
    add_column :users, :futsal_experience, :integer
    add_column :users, :tennis_rank, :string
    add_column :users, :climbing_level, :integer
    add_column :users, :climbing_block_color, :integer
    add_column :users, :workout_benchpress_weight, :integer
    add_column :users, :workout_squat_weight, :integer
    add_column :users, :running_distance, :integer
    add_column :users, :running_speed, :integer
  end
end
