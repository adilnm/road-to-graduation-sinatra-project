class RenameTodosTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :todos, :to_dos
  end
end
