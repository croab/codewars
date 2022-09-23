def find_anagrams(word, test_words)
  result_array = []
  test_words.each { |test_word| result_array << test_word if anagram?(word.split(""), test_word.split("")) }
  return result_array
end

def anagram?(character_array_1, character_array_2)
  lengths_match = character_array_1.size == character_array_2.size ? true : false
  not_the_same_array = character_array_1 != character_array_2 ? true : false
  same_array_content = character_array_1.sort == character_array_2.sort ? true : false
  return lengths_match && not_the_same_array && same_array_content ? true : false
end
