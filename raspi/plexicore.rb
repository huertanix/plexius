require 'pi_piper'
include PiPiper

#after :pin => 1, :goes => :high do
#  puts 'Button pressed!'
#end
PiPiper.watch :pin => 17, :invert => true do |pin|
  puts "Pin changed from #{pin.last_value} to #{pin.value}"
end

PiPiper.wait