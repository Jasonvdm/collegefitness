class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.text :description
      t.string :difficulty
      t.boolean :equipment
      t.string :equipmentneeded

      t.timestamps
    end
  end
end
