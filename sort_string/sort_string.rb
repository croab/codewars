def order(words)
  words_array = words.split(" ")
  words_hash = {}
  words_array.each do |word|
    position = obtain_position(word)
    words_hash[word] = position
  end
  sorted = words_hash.sort_by {|_key, value| value}.to_h
  return sorted.keys.join(" ")
end

def obtain_position(word)
  word.split(//).each do |character|
    if (1..9).to_a.include?(character.to_i)
      return character.to_i
    end
  end
end


# obtain_position('hel4lo')

# "is2 Thi1s T4est 3a"  -->  "Thi1s is2 3a T4est"
# "4of Fo1r pe6ople g3ood th5e the2"  -->  "Fo1r the2 g3ood 4of th5e pe6ople"
# ""  -->  ""
words = "is2 Thi1s T4est 3a"
order(words)

# How experienced are founders
