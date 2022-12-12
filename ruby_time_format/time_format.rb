def format_duration(seconds)
  if (seconds == 0)
    return 'now'
  elsif seconds > 0
    years = seconds / (60 * 60 * 24 * 365)
    remaining_seconds = seconds - (years * 60 * 60 * 24 * 365)
    days = remaining_seconds / (60 * 60 * 24)
    remaining_seconds = remaining_seconds - (days * 60 * 60 * 24)
    hours = remaining_seconds / (60 * 60)
    remaining_seconds = remaining_seconds - (hours * 60 * 60)
    minutes = remaining_seconds / 60
    seconds = remaining_seconds - (minutes * 60)
    time_array = [years, days, hours, minutes, seconds].reject {|x| x == 0}

    # puts "#{years} years, #{days} days, #{hours} hours, #{minutes} minutes and #{seconds} seconds"
    time_array.each do
  end
end

format_duration(10004343)