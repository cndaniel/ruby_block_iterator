require 'csv'

Transaction = Struct.new(:number, :type, :amount)

class TransactionHistory
  include Enumerable

  def initialize
    @transactions = []
  end

  def add_transaction(number, type, amount)
    transaction = Transaction.new(number, type, amount)
    @transactions << transaction
  end

  def each
    @transactions.each { |txn| yield txn }
  end

  def each_number
    @transactions.each { |txn| yield txn.number }
  end

  def each_of_type(type)
    @transactions.select{ |t| t.type == type }.each { |txn| yield txn }
  end

  def filtered_by_type(type)
    @transactions.select {|t| t.type == type}
  end

  def grouped_by_type
    [:sale, :refund, :void].each do |type|
      yield type, filtered_by_type(type)
    end
  end
end

history = TransactionHistory.new
history.add_transaction("1234", :sale, 10.00)
history.add_transaction("5678", :refund, 20.00)
history.add_transaction("7645", :void, 25.00)
history.add_transaction("1986", :refund, 10.00)
history.add_transaction("4091", :sale, 30.00)

puts "Transaction History:"
history.each { |txn| p txn }

p history.map { |txn| txn.number }
p history.reduce(0) { |sum, txn| sum + txn.amount }

puts "Transaction Numbers:"
history.each_number { |number| p number }

puts "Sale Transactions:"
history.each_of_type(:sale) { |txn| p txn }

puts "Refund Transactions:"
history.each_of_type(:refund) { |txn| p txn }

puts "Transaction Grouped by Type:"
history.grouped_by_type { |type, txn| p type, txn }

p history.reduce(0) { |sum, txn| sum + txn.amount }

