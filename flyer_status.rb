class Flyer
  attr_reader :name, :email, :miles_flown
  attr_accessor :status

  def initialize(name, email, miles_flown, status=:bronze)
    @name = name
    @email = email
    @miles_flown = miles_flown
    @status = status
  end

  def to_s
    "#{name} (#{email}): #{miles_flown} - #{status}"
  end
end

flyers = []
flyers << Flyer.new("Larry", "larry@example.com", 4000, :platinum)
flyers << Flyer.new("Moe", "moe@example.com", 1000)
flyers << Flyer.new("Curly", "curly@example.com", 3000, :gold)
flyers << Flyer.new("Shemp", "shemp@example.com", 2000)


# frequent_customer = flyers.select { |f| f.miles_flown >= 3000}
# puts "frequent customers are: "
# puts frequent_customer
#
# puts "les frequent_customers are:"
# less_frequent_customer = flyers.reject { |f| f.miles_flown >= 3000}
# puts less_frequent_customer
#
#
# puts "Have any of the flyers achieved platinum status?"
# puts flyers.any? { |f| f.status = :platinum}
#
# puts flyers.detect{ |f| f.status = :bronze}

platinum_flyers, other_flyers = flyers.partition{|f| f.status == :platinum }
puts "platinum fyers are: #{platinum_flyers} and others are #{other_flyers}"


name_tags = flyers.map {|f| "#{f.name} (#{f.status.upcase})" }
puts name_tags


totals_in_kms = flyers.map { |flyer| flyer.miles_flown * 1.6 }
p totals_in_kms

total_miles_flown = flyers.reduce(0) { |sum, flyer| sum + flyer.miles_flown }

puts "Total miles flown: #{total_miles_flown}"

total_kms_flown = totals_in_kms.reduce { |sum, kms| sum + kms }
puts total_kms_flown

kilo_flown_brozen = flyers.select{|f| f.status == :bronze}
.map{|bronze_flyer| bronze_flyer.miles_flown * 1.6}
.inject(:+)
puts kilo_flown_brozen

max_flyers  =  flyers.max_by{|f| f.miles_flown}
puts max_flyers
