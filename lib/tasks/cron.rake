task :cron => [:environment] do
	puts "Pulling new requests..."
	User.all.each do |user|
		if(user.number_path)
			ApplicationMailer.workout_msg(user, Workout.first, user.number_path).deliver
		end
	end
	puts "Done."
end

