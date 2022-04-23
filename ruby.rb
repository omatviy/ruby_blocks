class Order

    TAX_TABLE = {'CO':0.02, 'MT':0.00, 'AZ':0.04}.freeze

    attr_reader :email, :total, :state, :status

    def initialize(email, total, state, status = :pending)
        @email = email
        @total = total
        @state = state
        @status = status
    end

    def to_s
        "#{email} (#{state}): $#{total} - #{status}"
    end

    def tax
        total * TAX_TABLE[state]
    end
end

orders = []

orders << Order.new("email1@mail.com", 300, 'MT')
orders << Order.new("email2@mail.com", 400, 'AZ', :completed)
orders << Order.new("email3@mail.com", 200, 'CO')
orders << Order.new("email4@mail.com", 100, 'CO', :completed)

puts orders

big_orders = []

big_orders = orders.select {|o| o.total >= 300}

puts "Big orders:", big_orders

small_orders = orders.reject {|o| o.total >= 300}
puts "Small orders:", small_orders

pending_status_orders = orders.any? {|o| o.status == :pending}
puts "Pending orders:", pending_status_orders

#забирає тільки перший елемент
pending_orders = orders.detect {|o| o.status == :pending}
puts "Pending orders:", pending_orders


