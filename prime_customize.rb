# def find_primes(f,l)
#   (f...l).select do |n|
#      counter = n-1
#      loop do
#        if n %counter !==0
#          counter -=1
#         break if n %counter ==0
#         return true
#      end
#   #code
# end


def is_prime?(n)
  factor = n-1
  loop do
    factor -= 1
    break if factor ==1
    return false
    break if n % factor ==0
    return true

    
   end
end

p is_prime?(3)
