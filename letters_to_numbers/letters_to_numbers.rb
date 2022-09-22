def alphabet_position(text)
  hash_to_numbers = ('a'..'z').zip(1..26).to_h
  letters_array = text.downcase.split(//)
  results_array = []
  letters_array.map! do |letter|
    if ('a'..'z').to_a.include?(letter)
      results_array << hash_to_numbers[letter]
    end
  end
  return results_array.join(' ')
end

test_string = "The sunset sets at twelve o' clock."
puts alphabet_position(test_string)
