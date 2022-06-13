class CreateRunningPerformances < ActiveRecord::Migration[5.2]
  def change
    create_table :running_performances do |t|
      t.references :user, index: true
      t.integer :running_frequency, default: 0
      t.integer :running_experience, default: 0 
      t.integer :running_distance, default: 0
      t.integer :running_speed, default: 0

      t.timestamps
    end
  end
end
