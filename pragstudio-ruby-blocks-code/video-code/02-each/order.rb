class Order
  attr_reader :email, :total

  def initialize(email, total)
    @email = email
    @total = total
  end

  def to_s
    "#{email}: $#{total}"
  end
end

orders = []
1.upto(5) do |number|
  orders << Order.new("customer#{number}@example.com", number * 10)
end
puts orders

puts "Newsletter emails:"
orders.each { |order| puts order.email }

sum = 0
orders.each { |order| sum += order.total }
puts "Total sales: $#{sum}"

taxes = { "CO" => 0.02, "MT" => 0.00, "AZ" => 0.04 }

puts "Tax Table:"
taxes.each do |key, value|
  puts "#{key}: #{value * 100}%"
end


