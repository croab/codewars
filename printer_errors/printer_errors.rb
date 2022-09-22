def printer_error(s)
	string_length = s.size
  error_rate = 0
  s.split("").each { |letter| error_rate += 1 if ("n".."z").include?(letter.downcase) }
  return "#{error_rate.to_s}/#{string_length.to_s}"
end
