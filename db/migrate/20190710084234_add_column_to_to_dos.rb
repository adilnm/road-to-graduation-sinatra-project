class AddColumnToToDos < ActiveRecord::Migration[5.2]
  def change
    add_column :to_dos, :description, :string
  end
end
