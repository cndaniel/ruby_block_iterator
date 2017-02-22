def time_it(label)
  start_time = Time.now
  yield
  elapsed_time = Time.now - start_time
  puts "#{label} took #{elapsed_time}"
end

time_it("Sleepy code") do
  # run arbitrary code
  sleep(0.5)
end

time_it("Sleepier code") do
  # run arbitrary code
  sleep(1.0)
end
