def next_smaller(n)
  digits_array = n.to_s.split("")
  sorted_digits_array = digits_array.select { |digit| digit.to_i <= digits_array[0].to_i }.sort_by { |number| -number.to_i}
  starting_digits = []
  for i in 0..sorted_digits_array.size do
    starting_digits << sorted_digits_array[i] if sorted_digits_array[i].to_i != 0 && starting_digits.size < 2 && !starting_digits.include?(sorted_digits_array[i])
  end
  p "Starting digits are #{starting_digits}"
  final_numbers = []
  starting_digits.each do |starting_digit|
    p "Starting digit = #{starting_digit}"
    digits_array_copy = digits_array.dup
    index_of_starting_digit = digits_array_copy.index(starting_digit)
    digits_array_copy.delete_at(index_of_starting_digit)
    p "Remaining digits = #{digits_array_copy}"
    remaining_digit_combinations = digits_array_copy.permutation(digits_array_copy.size).to_a
    remaining_digit_combinations.each { |digits| digits.unshift(starting_digit)}
    remaining_digit_combinations.map! { |combination| combination.join.to_i }
    p remaining_digit_combinations
    valid_numbers = remaining_digit_combinations.select { |number| number < n }.sort_by { |number| -number}
    final_numbers.concat(valid_numbers)
  end
  return -1 if final_numbers.size == 0
  return -1 if final_numbers[0].to_s.split("").size < digits_array.size
  return final_numbers[0]
end
p "Expecting 790"
p next_smaller(907)
p "Expecting 351"
p next_smaller(513)
# == 513
p "Expecting 2017"
p next_smaller(2071)
# == 2017
p "Expecting -1"
p next_smaller(1027)

p "Expecting 144"
p next_smaller(414)