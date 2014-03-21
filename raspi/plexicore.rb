require 'pi_piper'
include PiPiper

# Based on: http://makezine.com/projects/tutorial-raspberry-pi-gpio-pins-and-python/

#pin_shutter = PiPiper::Pin.new(:pin => 24, :direction => :in, :pull => :up)

# It works, but maybe because the Python script reset something?
after :pin => 24, :goes => :high do
  puts 'Button pressed!'
end

# Also works
#watch :pin => 24 do |pin|
#  puts "Pin changed from #{pin.last_value} to #{pin.value}"
#end

PiPiper.wait
