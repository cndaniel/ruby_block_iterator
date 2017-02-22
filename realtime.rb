require 'benchmark'

elapsed_time = Benchmark.realtime do
  sleep(1)
end


puts "It took #{elapsed_time}"

 
