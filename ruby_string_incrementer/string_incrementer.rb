def increment_string(input)
  input_array = input.split('')
  input_array_reversed = input_array.reverse
  numbers_array_reversed = []
  remaining_char_reversed = []
  input_array_reversed.each_with_index do |character, index|
    if index == 0 && !character.match(/^(\d)+$/)
      return input + '1'
    elsif character.match(/^(\d)+$/)
      numbers_array_reversed.push(character)
    else
      remaining_char_reversed.push(character)
    end
  end
  final_number = numbers_array_reversed.reverse.join('').to_i
  final_number += 1
  remaining_char = remaining_char_reversed.reverse.join('')
  return remaining_char + final_number.to_s
end

puts increment_string('foo')
puts increment_string('foo24')