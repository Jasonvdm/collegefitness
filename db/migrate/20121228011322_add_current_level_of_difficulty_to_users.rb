class AddCurrentLevelOfDifficultyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_level_difficulty, :string, :default => "Beginner"
    add_column :workouts, :type, :string
  end
end
