task :downloadcsv => [:environment] do
	

	require 'csv'

	puts "Starting process. Opening spreadsheet"	 
	tmp_dir = File.expand_path('../', __FILE__)
	puts tmp_dir
	CSV.foreach("#{tmp_dir}/CollegeStrong.csv", :headers => true) do |row|
		workouts = Workout.where(:wid => row[0])
		if workouts.count == 0
			workout = Workout.new
		else
			workout = workouts.first
		end	
		workout.wid = row[0]
		workout.name = row[1]
		workout.workout_type = row[2]
		workout.difficulty = row[3]
		workout.description = row[4]
		if row[5] != "None"
			workout.has_equipment = true
			workout.equipment_list = row[5]
		else
			workout.has_equipment = false
		end
		workout.save
	end
	puts "Operation completed"
end

