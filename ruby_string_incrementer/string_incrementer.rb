def increment_string(input)
  input_array = input.split('')
  input_array_reversed = input_array.reverse
  numbers_array_reversed = []
  remaining_char_reversed = []
  input_array_reversed.each_with_index do |character, index|
    if index == 0 && !character.match(/^(\d)+$/)
      return input + '1'
    elsif character.match(/^(\d)+$/)
      puts character
      numbers_array_reversed.push(character)
    else
      remaining_char_reversed.push(character)
    end
  end
  num_array_length = numbers_array_reversed.length
  final_number = numbers_array_reversed.reverse.join('').to_i
  final_number += 1
  num_leading_zeroes = num_array_length - final_number.digits.count
  leading_zeroes = '0' * num_leading_zeroes
  final_number_string = final_number.to_s
  final_number_string.insert(0, leading_zeroes)
  remaining_char = remaining_char_reversed.reverse.join('')
  return remaining_char + final_number_string
end

puts increment_string('foobar002')