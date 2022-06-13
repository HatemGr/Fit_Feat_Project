class CreateTennisPerformances < ActiveRecord::Migration[5.2]
  def change
    create_table :tennis_performances do |t|
      t.references :user, index: true
      t.integer :tennis_frequency, default: 0
      t.integer :tennis_experience, default: 0
      t.string :tennis_rank, :string

      t.timestamps
    end
  end
end
