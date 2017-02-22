class Order

  TAX_TABLE = { "CO" => 0.02, "MT" => 0.00, "AZ" => 0.04 }

  attr_reader :email, :state, :total, :status

  def initialize(email, state, total, status=:pending)
    @email = email
    @state = state
    @total = total
    @status = status
  end

  def tax
    total * TAX_TABLE[state]
  end

  def to_s
    "#{email} (#{state}): $#{total} - #{status}"
  end
end

orders = []
orders << Order.new("customer1@example.com", "MT", 300)
orders << Order.new("customer2@example.com", "AZ", 400, :completed)
orders << Order.new("customer3@example.com", "CO", 200)
orders << Order.new("customer4@example.com", "CO", 100, :completed)

puts "Big Orders:"
big_orders = orders.select { |order| order.total >= 300 }
puts big_orders

puts "Small Orders:"
small_orders = orders.reject { |order| order.total >= 300 }
puts small_orders

puts orders.any? { |order| order.status == :pending }

order = orders.detect { |order| order.status == :pending }
puts order

pending_orders, completed_orders = orders.partition { |order| order.status == :pending }
puts "Pending:"
puts pending_orders
puts "Completed:"
puts completed_orders

big_orders, small_orders = orders.partition { |order| order.total >= 300 }
puts "Big:"
puts big_orders
puts "Small:"
puts small_orders

puts "Newletter emails:"
emails = orders.map { |order| order.email.downcase }
p emails

puts "Colorado taxes:"
co_orders = orders.select { |order| order.state == "CO" }
co_taxes = co_orders.map { |order| order.tax }
p co_taxes

co_taxes = orders.select { |o| o.state == "CO" }.map { |o| o.tax }
p co_taxes

sum = orders.reduce(0) { |sum, order| sum + order.total }
puts "Total sales: $#{sum}"

total_tax = orders.reduce(0) { |sum, order| sum + order.tax }
puts "Total tax: $#{total_tax}"


# same as using map/reduce

total = orders.map { |order| order.total }.reduce(:+)
puts "Total sales: $#{total}"

total_tax = orders.map { |order| order.tax }.reduce(:+)
puts "Total tax: $#{total_tax}"

