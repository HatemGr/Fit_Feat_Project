class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :description, :text
    add_column :users, :birthdate, :datetime
    add_column :users, :longitude, :float
    add_column :users, :latitude, :float
    add_reference :users, :city, index: true
    add_column :users, :tennis_frequency, :integer, default: 0
    add_column :users, :workout_frequency, :integer, default: 0
    add_column :users, :running_frequency, :integer, default: 0
    add_column :users, :climbing_frequency, :integer, default: 0
    add_column :users, :futsal_frequency, :integer, default: 0
    add_column :users, :tennis_experience, :integer, default: 0
    add_column :users, :workout_experience, :integer, default: 0
    add_column :users, :running_experience, :integer, default: 0
    add_column :users, :climbing_experience, :integer, default: 0
    add_column :users, :futsal_experience, :integer, default: 0
    add_column :users, :tennis_rank, :string
    add_column :users, :climbing_level, :integer, default: 0
    add_column :users, :climbing_block_color, :string
    add_column :users, :workout_benchpress_weight, :integer, default: 0
    add_column :users, :workout_squat_weight, :integer, default: 0
    add_column :users, :running_distance, :integer, default: 0
    add_column :users, :running_speed, :integer, default: 0
  end
end
