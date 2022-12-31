def next_smaller(n)
  # digits_array = n.to_s.split("")
  # sorted_digits_array = digits_array.select { |digit| digit.to_i <= digits_array[0].to_i }.sort_by { |number| -number.to_i}
  # starting_digits = []
  # for i in 0..sorted_digits_array.size do
  #   starting_digits << sorted_digits_array[i] if sorted_digits_array[i].to_i != 0 && starting_digits.size < 2 && !starting_digits.include?(sorted_digits_array[i])
  # end
  # starting_digits.each do |starting_digit|
  #   if (starting_digit == digits_array[0])
  #     digits_array_copy = digits_array.dup
  #     result = digits_array_copy.insert(-2, digits_array_copy.delete_at(-1))
  #     result = result.join.to_i
  #     return result if result < n
  #   else
  #     digits_array_copy = digits_array.dup
  #     index_of_starting_digit = digits_array_copy.index(starting_digit)
  #     digits_array_copy.delete_at(index_of_starting_digit)
  #     digits_array_copy.sort_by { |number| -number.to_i}
  #     digits_array_copy.unshift(starting_digit)
  #     result = digits_array_copy.join.to_i
  #     return result
  #   end
  # end
  # return -1
  digits_array = n.to_s.split("")
  reverse_digits_array = digits_array.reverse
  # sorted_digits_array = digits_array.select { |digit| digit.to_i <= digits_array[0].to_i }.sort_by { |number| -number.to_i}
  digits_to_modify = []
  non_zero_digits = 0
  for i in 0..reverse_digits_array.size do
    non_zero_digits += 1 if reverse_digits_array[i].to_i != 0
    if (non_zero_digits <= 2)
      digits_to_modify << reverse_digits_array[i]
    end
  end
  digits_to_modify.reverse!
  digits_unchanged = digits_array[0...-(digits_to_modify.size)]
  return digits_to_modify.insert(-2, digits_array_copy.delete_at(-1))
end
p "Expecting 1234508006"
p next_smaller(12345608)
p "Expecting 1234508006"
p next_smaller(1234560008)
p "Expecting 1234567890"
p next_smaller(1234567908)
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