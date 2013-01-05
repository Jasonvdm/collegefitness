class Workout < ActiveRecord::Base
	
  attr_accessible :description, :difficulty, :equipment, :equipmentneeded, :name
  attr_accessible :avatar, :has_equipment, :equipment_list, :workout_type
  has_attached_file :avatar, :styles => { :medium => "232x155#", :thumb => "100x100>", :large => "408x272>" }
end
