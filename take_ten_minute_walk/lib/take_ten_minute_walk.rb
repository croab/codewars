def is_valid_walk(walk)
  x_coordinate = 0
  y_coordinate = 0
  walk.each do |direction|
    x_coordinate += convert_directions(direction) if direction == 'w' || direction == 'e'
    y_coordinate += convert_directions(direction) if direction == 'n' || direction == 's'
  end
  return [x_coordinate, y_coordinate] == [0,0] && walk.size == 10 ? true : false
end

def convert_directions(direction)
  case direction
  when 'n'
    return 1
  when 'e'
    return 1
  when 's'
    return -1
  when 'w'
    return -1
  end
end
