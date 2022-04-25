class Sensor
  def temperature
    rand(100..200)
  end

  def level
    rand(1..5)
  end
end

def checking(description)
  puts "Checking #{description}"
  puts yield ? "Ok" : "Failed"
end

sensor = Sensor.new
checking("Check water temperature") {sensor.temperature < 150}
checking("Check water level") {sensor.level < 3}