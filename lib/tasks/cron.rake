task :cron => [:environment] do
	puts "Pulling new requests..."
	User.all.each do |user|
		if(user.number_path)
			difficulty = user.current_level_difficulty
			equipment_needed = user.has_equipment 
			time = Time.new
			if time.wday == 1
				exercise_type = "Cross training"
			elsif time.wday == 2 
				exercise_type = "Cardio"
			elsif time.wday == 3	
				exercise_type = "Strength"
			elsif time.wday == 4	
				exercise_type = "Cardio"
			elsif time.wday == 5	
				exercise_type = "Cross training"
			end	
			workouts = Workout.where(:difficulty => difficulty, :has_equipment => equipment_needed, :workout_type => exercise_type)
			array_size = workouts.length
			puts array_size
			r = Random.rand(1...array_size)
			ApplicationMailer.workout_msg(user, workouts[r], user.number_path).deliver
			user.last_workout = workouts[r].name
			num_workouts = user.total_num_workouts
			user.total_num_workouts = num_workouts + 1
			user.save
		end
	end
	puts "Done."
end

