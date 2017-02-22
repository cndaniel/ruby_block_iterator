def with_debugging
  puts "Got Here!"
  result = yield
  puts "Result was #{result}"
end

with_debugging do
  # some code
  result = (23 - Time.now.hour) * Math::PI
end
