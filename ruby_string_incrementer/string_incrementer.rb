def increment_string(input)
  input_array_reversed = input.split('').reverse

  # Initialize
  numbers_array_reversed = []
  remaining_char_reversed = []

  # Loop over reversed input array to pick out trailing numbers
  input_array_reversed.each_with_index do |character, index|
    if index == 0 && !character.match(/^(\d)+$/)
      return input + '1'
    elsif character.match(/^(\d)+$/)
      numbers_array_reversed.push(character)
    else
      remaining_char_reversed.push(character)
    end
  end

  # Determine new final number (irrespective of leading zeroes)
  final_number = numbers_array_reversed.reverse.join('').to_i + 1
  # Determine number of leading zeroes (removed by Ruby)
  leading_zeroes = num_leading_zeroes(numbers_array_reversed.reverse)
  # Convert final number to string
  final_number_string = final_number.to_s
  # Add leading zeroes
  final_number_string.insert(0, leading_zeroes)
  # Obtain the rest of the word as string
  remaining_char_string = remaining_char_reversed.reverse.join('')
  # Combine the two!
  return remaining_char_string + final_number_string
end

def num_leading_zeroes(numbers_array)
  num_zeroes = 0
  numbers_array.each do |elem|
    if elem == '0'
      num_zeroes += 1
    end
  end
  num_zeroes -= 1 if num_zeroes == numbers_array.size
  return '0' * num_zeroes
end

puts increment_string('foobar00')