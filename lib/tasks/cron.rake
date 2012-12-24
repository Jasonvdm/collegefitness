task :cron => [:environment] do
  puts "Pulling new requests..."
  ApplicationMailer.contact.deliver
  puts "Done."
end

task :cron => [:environment] do
  puts "Sending welcome messages..."
  ApplicationMailer.welcome_msg(User.first)
  pust "Done."
end
