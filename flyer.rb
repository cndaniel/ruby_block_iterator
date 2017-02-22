class Flyer
  attr_reader :name, :email, :miles_flown
  attr_accessor :status
  def initialize(name, email, miles_flown)
    @name = name
    @email = email
    @miles_flown = miles_flown
  end

  def to_s
    "#{name} (#{email}): #{miles_flown}"
  end
end

flyers =[]
1.upto(5) do |f|
  flyers << Flyer.new("Flyer #{f}", "flyer#{f}@example.com", f*1000)
end

#flyers.each { |f| puts "#{f.name} - #{f.miles_flown} miles"}

sum =0

flyers.each {|f| sum += f.miles_flown}
puts "Total miles flown: #{sum}"

promotions ={ "United" => 1.5, "Delta" => 2.0, "Lufthansa" => 2.5}

promotions.each {|key, value| puts "Earn #{value}x miles by flying #{key}!"}


flyers.each do |flyer|
  promotions.each do |k, v|
    puts "#{flyer.name} could earn #{v*flyer.miles_flown} ,miles by flying #{k} "
  end
end
