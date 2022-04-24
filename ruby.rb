class Order
  TAX_TABLE = { 'CO': 0.02, 'MT': 0.00, 'AZ': 0.04 }.freeze

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
    total * TAX_TABLE[state.to_sym]
  end
end

orders = []

orders << Order.new("email1@mail.com", 300, "MT")
orders << Order.new("email2@mail.com", 400, "AZ", :completed)
orders << Order.new("email3@mail.com", 200, "CO")
orders << Order.new("email4@mail.com", 100, "CO", :completed)

puts orders

big_orders = []

big_orders = orders.select { |o| o.total >= 300 }

puts "Big orders:", big_orders

small_orders = orders.reject { |o| o.total >= 300 }
puts "Small orders:", small_orders

pending_status_orders = orders.any? { |o| o.status == :pending }
puts "Pending orders:", pending_status_orders

#забирає тільки перший елемент
pending_orders = orders.detect { |o| o.status == :pending }
puts "Pending orders:", pending_orders

results = orders.partition { |o| o.status == :pending }
p results

puts "Another way"
pending_orders, completed_orders = orders.partition { |o| o.status == :pending }
puts pending_orders
puts completed_orders

puts "Another way for big_orders, small_orders"
big_orders, small_orders = orders.partition { |o| o.total >= 300 }
puts big_orders
puts small_orders

puts "Newsletter emails:"
emails = []
orders.each { |o| emails << o.email.downcase }
p emails

puts "Taxes:"
co_orders = orders.select { |o| o.state == "CO" }
p co_orders

co_taxes = co_orders.map { |o| o.tax }
p co_taxes

sum = orders.reduce(0) { |sum, order| sum + order.total }
puts "Total sales: $#{sum}"

total_tax = orders.reduce(0) { |total, order| total + order.tax }
puts "Total sales: $#{total_tax}"

p Order::TAX_TABLE 
