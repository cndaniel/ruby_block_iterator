number = 99
name = "Curly"
temp = Math::PI / 4

3.times do |number; temp|
  name = "Moe"
  temp = 98.6
  puts "#{number} Howdy, #{name} is #{temp}!"
end

puts name    # => Moe
puts number  # => 99
puts temp    # => 0.7853981633974483
