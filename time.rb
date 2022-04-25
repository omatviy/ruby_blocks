def time(label)
  start_time = Time.now
  yield
  elapsed_time = Time.now - start_time
  puts "#{label} - It took #{elapsed_time}"
end

time("Sleep") { sleep(0.5) }
