def top_3_words(text)
  raw_words_array = text.split(" ")
  word_object = Hash.new
  raw_words_array.each do |raw_word|
    word = raw_word.downcase.gsub(/[^abcdefghijklmnopqrstuvwxyz' ]/, '')
    word_without_apost = raw_word.downcase.gsub("'", '')
    if (word != '' && word_without_apost != '')
      word_object[word] ? word_object[word] += 1 : word_object[word] = 1
    end
  end
  final_object = word_object.sort_by { |key, value| -value }
  final_array = final_object[0...3].map {|elem| elem[0]}

  return final_array
end

# top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")
# top_3_words("  , e   .. ")
# top_3_words("  '''  ")