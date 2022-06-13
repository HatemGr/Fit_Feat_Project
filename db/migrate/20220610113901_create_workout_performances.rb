class CreateWorkoutPerformances < ActiveRecord::Migration[5.2]
  def change
    create_table :workout_performances do |t|
      t.references :user, index: true
      t.integer :workout_frequency, default: 0
      t.integer :workout_experience, default: 0
      t.integer :workout_benchpress_weight, default: 0
      t.integer :workout_squat_weight, default: 0

      t.timestamps
    end
  end
end
