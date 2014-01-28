loop do
  raspi_user = "pi"
  unixtime = Time.now.to_i

  if system "raspistill -rot 90 -ISO 800 -o /home/#{raspi_user}/pix/#{unixtime}.jpg"
    puts "#{unixtime}.jpg saved!"
  else
    puts "ROFLCOPTER DOWN!"
  end

  sleep 60
end
