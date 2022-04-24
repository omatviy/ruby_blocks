def run_my_block
  puts "Starting method"
  yield if block_given?
  puts "Back in method"
end

run_my_block do
  puts "Running block"
end

def roll
  puts "Starting method roll"
  number = rand(1..6)
  result = yield "Masha", number if block_given?
  puts "Block return #{result}"
end

roll do |name, number|
  puts "Your name is #{name}. You rolled a #{number}"
  number*2
end
