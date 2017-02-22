class Sensor
  def temperature
    rand(100..200)
  end

  def level
    rand(1..5)
  end

end

sensor = Sensor.new
puts "Checking water temperature..."
result = sensor.temperature < 150
if result
  puts "OK"
else
  puts "FAILED!"
end

puts "Checking water level..."
result = sensor.level > 3
if result
  puts "OK"
else
  puts "FAILED!"
end

def with_checking(description)
  puts "Checking #{description}..."
  result = yield
  if result
    puts "OK"
  else
    puts "FAILED!"
  end
rescue Exception => e
  puts "ERROR!"
  raise e
end

with_checking("temperature") do
  sensor.temperature < 150
end

with_checking("level") do
  sensor.level > 3
end
