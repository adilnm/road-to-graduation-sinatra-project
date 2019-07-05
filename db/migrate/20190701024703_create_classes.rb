class CreateClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :classes do |t|
      t.string :name
      t.string :professor
      t.string :final_grade
    end
  end
end
