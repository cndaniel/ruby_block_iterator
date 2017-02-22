5.times do
  puts "situp"
  puts "pushup"
  puts "chinup"
end

5.times do |count|
  puts "#{count} situp"
  puts "#{count} pushup"
  puts "#{count} chinup"
end

1.upto(5) do |count|
  puts "#{count} situp"
  puts "#{count} pushup"
  puts "#{count} chinup"
end
