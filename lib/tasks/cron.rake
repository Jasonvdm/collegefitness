task :cron => [:environment] do
  puts "Pulling new requests..."
  ApplicationMailer.contact.deliver
  puts "done."
end