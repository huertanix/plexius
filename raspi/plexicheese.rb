loop do
  raspi_user = "pi"
  pix_directory = "pix"
  unixtime = Time.now.to_i

  if system "raspistill -ISO 800 -o /home/#{raspi_user}/#{pix_directory}/#{unixtime}.jpg"
    puts "#{unixtime}.jpg saved!"
  else
    puts "Failed to save #{unixtime}.jpg"
  end

  sleep 60
end
