require 'benchmark'

elapsed_time = Benchmark.realtime do
  # run some code
  sleep(1)
end

puts "It took #{elapsed_time}"
