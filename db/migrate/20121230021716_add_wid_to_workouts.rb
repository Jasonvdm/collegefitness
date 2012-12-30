class AddWidToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :wid, :integer
  end
end
