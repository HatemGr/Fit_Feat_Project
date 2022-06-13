class CreateClimbingPerformances < ActiveRecord::Migration[5.2]
  def change
    create_table :climbing_performances do |t|
      t.references :user, foreign_key: true
      t.integer :climbing_frequency, default: 0
      t.integer :climbing_experience, default: 0
      t.integer :climbing_level, default: 0
      t.string :climbing_block_color, default: 'Unknown'

      t.timestamps
    end
  end
end
