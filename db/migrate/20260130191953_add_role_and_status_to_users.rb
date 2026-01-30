class AddRoleAndStatusToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :role, :integer, default: 0, null: false
    add_column :users, :active, :boolean, default: true
    add_column :users, :last_logged_in_at, :datetime

    add_index :users, :role
  end
end