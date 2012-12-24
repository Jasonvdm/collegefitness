task :cron => [:environment] do
  puts "Pulling new requests..."
  ApplicationMailer.contact.deliver
  ApplicationMailer.welcome_msg(User.first, "This is a test").deliver
  puts "Done."
end

