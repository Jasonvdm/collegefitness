task :cron => [:environment] do
  puts "Pulling new requests..."
  ApplicationMailer.welcome_msg(User.last, "This is a test", User.last.email).deliver
  puts "Done."
end

