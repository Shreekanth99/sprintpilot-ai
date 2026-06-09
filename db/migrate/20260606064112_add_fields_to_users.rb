class AddFieldsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :name, :string
    add_column :users, :role, :integer, default: 3

    add_reference :users,
                  :organization,
                  null: true,
                  foreign_key: true
  end
end
