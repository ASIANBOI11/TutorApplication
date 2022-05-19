class CreateTutorCreations < ActiveRecord::Migration[7.0]
  def change
    create_table :tutor_creations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.text :description
      t.integer :price
      t.string :subject

      t.timestamps
    end
  end
end
