def narcissistic?(value)
  # Count number of digits in value
  # Break down value into digits
  # Raise each digit to the power of the number of digits
  # Obtain result
  # Check if result == value
  value.digits.map! { |number| number ** value.digits.size }.sum == value
end

puts narcissistic?(153)
