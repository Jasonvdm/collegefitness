class AddAttachmentAvatarToWorkouts < ActiveRecord::Migration
  def self.up
    change_table :workouts do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :workouts, :avatar
  end
end
