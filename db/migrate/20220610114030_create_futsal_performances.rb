class CreateFutsalPerformances < ActiveRecord::Migration[5.2]
  def change
    create_table :futsal_performances do |t|
      t.references :user, foreign_key: true
      t.integer :futsal_frequency, default: 0
      t.integer :futsal_experience, default: 0

      t.timestamps
    end
  end
end
