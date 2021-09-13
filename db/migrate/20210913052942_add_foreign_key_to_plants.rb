class AddForeignKeyToPlants < ActiveRecord::Migration[6.1]
  def change
    add_column :plants, :todo_id, :integer
  end
end
