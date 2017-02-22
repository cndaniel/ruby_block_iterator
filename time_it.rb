require "Benchmark"


def time_it(code_name)
  duration = Benchmark.realtime do
  yield
end
  puts "#{code_name} took #{duration}"
end


time_it("Sleep code") do
  sleep(1)
end
 
