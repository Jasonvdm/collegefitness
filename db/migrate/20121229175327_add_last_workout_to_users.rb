class AddLastWorkoutToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_workout, :string
    add_column :users, :total_num_workouts, :integer
  end
end
