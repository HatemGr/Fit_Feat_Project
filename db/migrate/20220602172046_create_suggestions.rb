class CreateSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :suggestions do |t|
      t.string :status
      t.boolean :coaching
      t.references :partnera
      t.references :partnerb
      t.timestamps
    end
  end
end
