
# db/migrate/XXXXXXXXXXXXXX_create_doctors.rb
class CreateDoctors < ActiveRecord::Migration[8.1]
  def change
    create_table :doctors do |t|
      t.references :user, null: false, foreign_key: true

      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :specialization, null: false
      t.string :medical_license_number, null: false
      t.string :phone
      t.boolean :active, default: true, null: false

      t.timestamps
    end

    add_index :doctors, :medical_license_number, unique: true
    add_index :doctors, :active
  end
end
