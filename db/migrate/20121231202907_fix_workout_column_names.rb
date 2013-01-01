class FixWorkoutColumnNames < ActiveRecord::Migration
  def change
  	rename_column :workouts, :equipment, :has_equipment
  	rename_column :workouts, :equipmentneeded, :equipment_list
  end
end
