def top_3_words(text)
  # split into array based on white space
  raw_words_array = text.split(" ")
  # Make lowercase
  # Remove everything other than a-z and '
  # Create object with word as key and value as counter
  word_object = Hash.new
  raw_words_array.each do |raw_word|
    word = raw_word.downcase.gsub(/[^abcdefghijklmnopqrstuvwxyz' ]/,'')
    # puts word
    word_object[word] ? word_object[word] += 1 : word_object[word] = 1
  end
  # Organise and evaluate top 3!
  puts word_object
end

top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")