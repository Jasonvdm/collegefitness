class Workout < ActiveRecord::Base
  attr_accessible :description, :difficulty, :equipment, :equipmentneeded, :name
end
