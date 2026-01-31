class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.references :user, null: false, foreign_key: true

      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :date_of_birth, null: false
      t.integer :gender, null: false
      t.string :phone, null: false
      t.text :address
      t.string :blood_group
      t.string :emergency_contact
      t.boolean :active, default: true

      t.timestamps
    end

    add_index :patients, :phone
    add_index :patients, :active
  end
end
