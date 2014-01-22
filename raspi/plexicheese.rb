require 'flickraw'

#flickr = FlickRaw::Flickr.new
# ugh oauth

loop do
  raspi_user = "pi"
  unixtime = Time.now.to_i

  if system "raspistill -o /home/#{raspi_user}/plexius/#{unixtime}.jpg"
    # Upload to ~THE CLOUD~

  else
    puts "ROFLCOPTER DOWN!"
  end

  sleep 60
end