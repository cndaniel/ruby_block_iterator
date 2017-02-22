module MyEnumerable
  def my_map
    new_array = []
    self.each do |value|
      new_array << yield(value)
    end
    new_array
  end

  def my_select
    new_array = []
    self.each do |value|
      new_array << value if yield(value)
    end
    new_array
  end
end

class Week
  #include Enumerable
  include MyEnumerable

  def initialize
    @days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
  end

  def each
    @days.each { |day| yield day }
  end
end

week = Week.new

puts week.my_select { |day| day.start_with?("T") }
puts week.my_map { |day| day.reverse }


