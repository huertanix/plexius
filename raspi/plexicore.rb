require 'wiringpi'

gpio = WiringPi::GPIO.new
# pin 1
button = 1

gpio.mode button, INPUT

loop do
  state = gpio.readAll
  # manual override!
  if state[button] == 0
    system "ruby raspicheese.rb"
  end

  sleep 0.3
end