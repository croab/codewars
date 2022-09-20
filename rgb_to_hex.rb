def rgb(r, g, b)
  "#{handle_value(r)}#{handle_value(g)}#{handle_value(b)}"
end

def handle_value(value)
  if value > 255
    value = 255
  elsif value < 0
    value = 0
  end
  value = value.to_s(16).upcase.rjust(2, '0')
  value == 1 ? value * 2 : value
end
