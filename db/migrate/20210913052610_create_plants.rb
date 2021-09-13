class CreatePlants < ActiveRecord::Migration[6.1]
  def change
    create_table :plants do |t|
      t.boolean :water
      t.boolean :fertilize
      t.boolean :prune
      t.boolean :repot
      t.string :notes
      t.string :img
      t.string :date

      t.timestamps
    end
  end
end
