def n_times (n)
   1.upto(n) do |count|
     yield count
   end
end



n_times(2) do |number|
  puts "#{number} situp"
  puts "#{number} pushup"
  puts "#{number} chinup"
end


def progress
  0.step(100,10) do |percent|
    yield (percent)
  end
end

 #progress{ |percent| puts "the current progress :#{percent}"}



 def greet
   yield "Larry", 18, 23
 end


greet { |name, age| puts "Hello, #{name}. You don't look #{age}!" }
