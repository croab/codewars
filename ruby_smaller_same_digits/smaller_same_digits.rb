def next_smaller(n)
  digits_array = n.to_s.split("").map {|str| str.to_i}
  sorted_digits_array = digits_array.sort_by { |digit| -digit}
  possible_first_digits = sorted_digits_array.select { |digit| digit <= digits_array[0] }
  possible_first_digits.each_with_index do |first_digit, index|
    if (index == 0)
      copied_digits_array = digits_array.dup
      copied_digits_array.insert(-2, copied_digits_array.delete_at(-1))
      number_attempt = copied_digits_array.join.to_i
      return number_attempt if number_attempt < n
    else
      copied_sorted_digits_array = sorted_digits_array.dup
      index_of_first_digit = copied_sorted_digits_array.find_index(first_digit)
      copied_sorted_digits_array.delete_at(index_of_first_digit)
      copied_sorted_digits_array.unshift(first_digit)
      number_attempt = copied_sorted_digits_array.join.to_i
      return number_attempt if number_attempt < n
    end
  end
  return -1
end

p next_smaller(531)
# == 513
p next_smaller(2071)
# == 2017