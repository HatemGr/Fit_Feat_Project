class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :city, foreign_key: true
      t.references :admin
      t.references :sport, foreign_key: true
      t.float :latitude
      t.float :longitude
      t.string :title
      t.datetime :date

      t.timestamps
    end
  end
end
