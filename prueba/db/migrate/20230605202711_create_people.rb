class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :identification
      t.string :first_name
      t.string :second_name
      t.string :first_last_name
      t.string :second_last_name
      t.references :document, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
