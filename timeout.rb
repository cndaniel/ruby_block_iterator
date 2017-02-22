require 'timeout'
require 'open-uri'






# Timeout.timeout(2.0) do
#   sleep 3.0
#   puts "That was refreshing"
# end

def try_with_timeout (second)
  begin
    Timeout.timeout(second) do
      yield
    end
  rescue Timeout::Error
    puts "Took too long…"
  end
end

web_page = try_with_timeout(1.0) do
  open("http://xinshengdaxue.com/")
end

puts web_page.read
#
# try_with_timeout(2.0) do
#   sleep 1.0
#   puts "That was refreshing…"
# end

try_with_timeout(2.0) do
  sleep 3.0
  puts "Yawn..."
end
