class CreateSportUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :sport_users do |t|
      t.references :user, index: true
      t.references :sport, index: true

      t.timestamps
    end
  end
end