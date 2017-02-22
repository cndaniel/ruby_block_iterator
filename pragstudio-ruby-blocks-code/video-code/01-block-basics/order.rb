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
