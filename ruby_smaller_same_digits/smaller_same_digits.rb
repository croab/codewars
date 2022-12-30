def next_smaller(n)
  digits_array = n.to_s.split("").map {|str| str.to_i}
  sorted_digits_array = digits_array.sort_by { |digit| -digit}
  possible_first_digits = sorted_digits_array.select { |digit| digit <= digits_array[0] }
  new_number = n
  # For each in possible_first_digits
  possible_first_digits.each do |first_digit|
    copied_sorted_digits_array = sorted_digits_array.dup
    index_of_first_digit = copied_sorted_digits_array.find_index(first_digit)
    copied_sorted_digits_array.delete_at(index_of_first_digit)
    p copied_sorted_digits_array
  end
  # Try keeping first number
  # Try to make a lower number using the remaining digits
  # If this doesn't work, find next highest number for position 1
  return possible_first_digits
end

next_smaller(531)
# == 513
next_smaller(2071)
# == 2017