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

#
# select
#
puts "Frequent Flyers:"
frequent_flyers = flyers.select { |flyer| flyer.miles_flown >= 3000 }
puts frequent_flyers

#
# reject
#
puts "Infrequent Flyers:"
infrequent_flyers = flyers.reject { |flyer| flyer.miles_flown >= 3000 }
puts infrequent_flyers

#
# any
#
puts flyers.any? { |flyer| flyer.status == :platinum }

#
# detect
#
first_bronze_flyer = flyers.detect { |flyer| flyer.status == :bronze }
puts first_bronze_flyer

#
# partition
#
platinum_flyers, other_flyers = flyers.partition { |flyer| flyer.status == :platinum }
puts "Platinum Flyers:"
puts platinum_flyers
puts "Other Flyers:"
puts other_flyers

#
# map
#
name_tags = flyers.map { |flyer| "#{flyer.name} (#{flyer.status.upcase})"}
p name_tags

totals_in_kms = flyers.map { |flyer| flyer.miles_flown * 1.6 }
p totals_in_kms

#
# reduce
#

total_miles_flown = flyers.reduce(0) { |sum, flyer| sum + flyer.miles_flown }
puts "Total miles flown: #{total_miles_flown}"

total_kms_flown = flyers.map { |flyer| flyer.miles_flown * 1.6 }.reduce(:+)
puts "Total kilometers flown: #{total_kms_flown}"

# bonus chaining:

total_bronze_kms_flown = flyers.select { |f| f.status == :bronze }.map { |f| f.miles_flown * 1.6 }.reduce(:+)
puts "Total Bronze kilometers flown: #{total_bronze_kms_flown}"
