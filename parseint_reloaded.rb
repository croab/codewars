# NUMBER_SET = {
#   "zero" => 0,
#   "one" => 1,
#   "two" => 2,
#   "three" => 3,
#   "four" => 4,
#   "five" => 5,
#   "six" => 6,
#   "seven" => 7,
#   "eight" => 8,
#   "nine" => 9,
#   "ten" => 10,
#   "eleven" => 11,
#   "twelve" => 12,
#   "thirteen" => 13,
#   "fourteen" => 14,
#   "fifteen" => 15,
#   "sixteen" => 16,
#   "seventeen" => 17,
#   "eighteen" => 18,
#   "nineteen" => 19,
#   "twenty" => 20,
#   "thirty" => 30,
#   "forty" => 40,
#   "fifty" => 50,
#   "sixty" => 60,
#   "seventy" => 70,
#   "eighty" => 80,
#   "ninety" => 90
# }

# def parse_int(string)
#   if string.include?("thousand")
#     handle_thousands(string)
#   elsif string.include?("hundred") && !string.include?("thousand")
#     handle_hundreds(string)
#   else
#     handle_tens(string)
#   end
# end

# def handle_thousands(thousands_hundreds_tens)
#   thousands_split = thousands_hundreds_tens.split("thousand").map{ |x| x.strip }
#   thousands_string = thousands_split[0]
#   # p "Thousands string: '#{thousands_string}'"
#   thousands_numeric = thousands_string.include?("hundred") ? handle_hundreds(thousands_string) : handle_tens(thousands_string)
#   thousands_numeric *= 1000
#   return thousands_numeric + handle_hundreds(thousands_split[1])
#   # TEST BELOW
#   # return handle_hundreds(thousands_split[1])
# end

# def handle_hundreds(hundreds_tens)
#   hundreds_split = hundreds_tens.split("hundred").map{ |x| x.strip }
#   hundreds_string = hundreds_split[0]
#   p "Hundreds string: '#{hundreds_string}'"
#   hundreds_numeric = NUMBER_SET[hundreds_string] * 100
#   return hundreds_numeric + handle_tens(hundreds_split[1])
#   # TEST BELOW
#   # return handle_tens(hundreds_split[1])
# end

# def handle_tens(tens)
#   tens.gsub!(/and /, "") if tens.include?("and")
#   p tens
#   if tens.include?("-")
#     tens = tens.split("-")
#     p tens
#     return NUMBER_SET[tens[0]] + NUMBER_SET[tens[1]]
#   else
#     return NUMBER_SET[tens]
#   end
#   # TEST BELOW
#   # p "Tens string: '#{tens}'"
# end


# # p parse_int("seven hundred eighty-three thousand nine hundred and nineteen")
# p parse_int("twenty")
NUMBER_SET = {
  "zero" => 0,
  "one" => 1,
  "two" => 2,
  "three" => 3,
  "four" => 4,
  "five" => 5,
  "six" => 6,
  "seven" => 7,
  "eight" => 8,
  "nine" => 9,
  "ten" => 10,
  "eleven" => 11,
  "twelve" => 12,
  "thirteen" => 13,
  "fourteen" => 14,
  "fifteen" => 15,
  "sixteen" => 16,
  "seventeen" => 17,
  "eighteen" => 18,
  "nineteen" => 19,
  "twenty" => 20,
  "thirty" => 30,
  "forty" => 40,
  "fifty" => 50,
  "sixty" => 60,
  "seventy" => 70,
  "eighty" => 80,
  "ninety" => 90
}

def parse_int(string)
  p string
  if string.include?("million")
    return 1000000
  elsif string.include?("thousand")
    handle_thousands(string)
  elsif string.include?("hundred")
    handle_hundreds(string)
  else
    handle_tens(string)
  end
end

def handle_thousands(thousands_hundreds_tens)
  thousands_split = thousands_hundreds_tens.split("thousand").map{ |x| x.strip }
  thousands_string = thousands_split[0]
  # p "Thousands string: '#{thousands_string}'"
  thousands_numeric = thousands_string.include?("hundred") ? handle_hundreds(thousands_string) : handle_tens(thousands_string)
  thousands_numeric *= 1000
  return thousands_numeric + handle_hundreds(thousands_split[1])
  # TEST BELOW
  # return handle_hundreds(thousands_split[1])
end

def handle_hundreds(hundreds_tens)
  return 0 if hundreds_tens.nil?
  p hundreds_tens
  if hundreds_tens.include?("hundred")
    hundreds_split = hundreds_tens.split("hundred").map{ |x| x.strip }
    hundreds_string = hundreds_split[0]
    p "Hundreds string: '#{hundreds_string}'"
    hundreds_numeric = NUMBER_SET[hundreds_string] * 100
    return hundreds_numeric + handle_tens(hundreds_split[1])
  else
    return handle_tens(hundreds_tens)
  end
  # TEST BELOW
  # return handle_tens(hundreds_split[1])
end

def handle_tens(tens)
  return 0 if tens.nil?
  tens.gsub!(/and /, "")
  p tens
  if tens.include?("-")
    tens = tens.split("-")
    p tens
    return NUMBER_SET[tens[0]] + NUMBER_SET[tens[1]]
  else
    return NUMBER_SET[tens]
  end
  # TEST BELOW
  # p "Tens string: '#{tens}'"
end

p parse_int("two hundred thousand three")
