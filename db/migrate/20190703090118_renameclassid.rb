class Renameclassid < ActiveRecord::Migration[5.2]
  def change
    rename_column :todos, :class_id, :course_id
  end
end
