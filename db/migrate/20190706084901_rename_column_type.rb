class RenameColumnType < ActiveRecord::Migration[5.2]
  def change
    rename_column :to_dos, :type, :category
  end
end
