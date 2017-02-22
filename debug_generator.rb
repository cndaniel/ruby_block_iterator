# magic_number = (23 - Time.now.hour) * Math::PI
#
# puts "Got Here!"
#
# magic_number = (23 - Time.now.hour) * Math::PI
#
# puts "Result was #{result}"
#

def with_debugging
  puts "Got Here!"
  result = yield
  puts "Result was #{result}"
end

def with_expectation(expected_value)
  if expected_value == yield
    puts "passed"
  else
    puts "failed"
    puts "expected #{expected_value}, but got #{yield}"
  end
end
with_debugging do
  magic_number = (23 - Time.now.hour) * Math::PI
end

with_expectation(4) { 3 + 2 }
