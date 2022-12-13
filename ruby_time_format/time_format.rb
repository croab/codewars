def format_duration(seconds)
  if (seconds == 0)
    return 'now'
  elsif seconds > 0
    # Assign time values
    time_hash = {
      years: seconds / (60 * 60 * 24 * 365),
      days: seconds / (60 * 60 * 24) % 365,
      hours: seconds / (60 * 60) % 24,
      minutes: seconds / 60 % 60,
      seconds: seconds % 60
    }

    sentence_array = []
    time_hash.each_with_index do |(time_period, value), index|
      if time_hash.size == 1
        phrase = "#{value} #{value == 1 ? time_period.to_s.chop : time_period.to_s}"
        sentence_array << phrase
        break
      elsif index == time_hash.size - 2
        phrase = "#{value} #{value == 1 ? time_period.to_s.chop : time_period.to_s} "
        sentence_array << phrase
      elsif index == time_hash.size - 1
        phrase = "and #{value} #{value == 1 ? time_period.to_s.chop : time_period.to_s}"
        sentence_array << phrase
      else
        phrase = "#{value} #{value == 1 ? time_period.to_s.chop : time_period.to_s}, "
        sentence_array << phrase
      end
    end
    return sentence_array.join('')
  end
end