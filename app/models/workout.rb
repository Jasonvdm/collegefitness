class Workout < ActiveRecord::Base
  attr_accessible :description, :difficulty, :equipment, :equipmentneeded, :name
  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
