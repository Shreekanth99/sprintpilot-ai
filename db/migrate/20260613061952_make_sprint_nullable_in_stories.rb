class MakeSprintNullableInStories < ActiveRecord::Migration[8.1]
  def change
    change_column_null :stories, :sprint_id, true
  end
end
