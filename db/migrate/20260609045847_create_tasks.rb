class CreateTasks < ActiveRecord::Migration[8.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.integer :status
      t.references :story, null: false, foreign_key: true
      t.references :assignee,
             null: true,
             foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
