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

taxes = {'CO':0.02, 'MT':0.00, 'AZ':0.04}

taxes.each do |key, value|
    puts "key: #{key} value:#{value}"
end

