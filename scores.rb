scores = [83, 71, 92, 64, 98, 87, 75, 69]
#
# high_scores = scores.select{ |s| s >= 80}
#
# # puts "High scores: "
# # puts high_scores
# #
# # low_scores = scores.reject { |s| s >= 80}
# # puts "low scores:"
# # puts low_scores
# #
# # puts "less than 70?"
# #
# # puts scores.any? { |s| s<70}
# #
# # puts "first failing score is:"
# # puts scores.detect {|s| s < 60}
# # puts "no even numbers!"
# # puts scores.reject!{ |score| score.even?}

scores_double = scores.map { |s| s * 2 }
puts scores_double

scores_total = scores.reduce(0){|total, s| total + s  }
puts scores_total


evens, odds = scores.partition{ |s| s.even? }
puts "Evens : #{evens}"
puts "Odds: #{odds}"
