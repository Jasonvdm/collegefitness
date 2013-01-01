class FixColumnDefaultUsers < ActiveRecord::Migration
  def change
  	change_column :users, :total_num_workouts, :integer, :default => 0
  end
end
