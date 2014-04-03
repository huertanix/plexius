raspi_user = "pi"
pix_directory = "pix"
unixtime = Time.now.to_i

if system "raspistill -w 1024 -h 768 -ISO 800 -o /home/#{raspi_user}/#{pix_directory}/#{unixtime}.jpg"
  puts "#{unixtime}.jpg saved!"
else
  puts "Failed to save #{unixtime}.jpg"
end
