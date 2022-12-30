def next_smaller(n)
  digits_array = n.to_s.split("")
  combinations = digits_array.permutation(digits_array.size).to_a
  combinations.map! { |array| array.join.to_i }
  possible_numbers = combinations.filter { |number| number < n}
  sorted_combinations = possible_numbers.sort_by { |number| -number}
  return -1 if sorted_combinations.size == 0
  return -1 if sorted_combinations[0].to_s.split("").size < digits_array.size
  return sorted_combinations[0]
end
p "Expecting 513"
p next_smaller(531)
# == 513
p "Expecting 2017"
p next_smaller(2071)
# == 2017
p "Expecting -1"
p next_smaller(1027)

p "Expecting 144"
p next_smaller(414)