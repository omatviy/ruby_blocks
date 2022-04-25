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
  number * 2
end

class Integer
  def n_times
    i = 0
    while i < self
      yield i
      i += 1
    end
  end
end

10.n_times { |i| puts "Echo #{i}" }

class Array
  def each
    i = 0
    while i < self.size
      yield self[i]
      i += 1
    end
  end
end

week = %w[monday tuesday wensday thursday friday saturday sunday]
week.each {|d| puts d.capitalize}