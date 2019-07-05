class CreateToDos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :name
      t.string :type
      t.date :deadline
      t.integer :user_id
      t.integer :class_id
    end
  end
end
