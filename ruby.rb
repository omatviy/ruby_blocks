class Order
    attr_reader :email, :total

    def initialize(email, total)
        @email = email
        @total = total
    end

    def to_s
        "#{email} : #{total}"
    end
end

orders = []
5.times do |n|
    orders << Order.new("customer#{n}@mail.com", 10)
end

puts orders

puts "Newsletter emails"

orders.map do |order| 
    puts order.email 
end

sum = 0
orders.map do |order| 
    sum += order.total
end

puts "Total sales $#{sum}"