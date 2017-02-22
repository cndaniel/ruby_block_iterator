cards = ["Jack", "Queen", "King", "Ace","Joker"]
cards.reverse_each { |card| puts "#{card.upcase} - #{card.length}"}
