def snail(array)
  result_array = []
  while array.any?
    p "Hi"
    # Add first array to result array
    result_array.push(*array[0])
    # Delete_at array[0]
    array.delete_at(0)
    p array
    break if !array.any?
    # Iterate over each element of outer array
    # Add last element to result and delete it from array
    array.each do |elem|
      result_array.push(elem.last)
      elem.delete_at(-1)
    end
    p array
    break if !array.any?
    # Add the reverse of the last array to result
    result_array.push(*array[-1].reverse)
    # Delete last row
    array.delete_at(-1)
    p array
    break if !array.any?
    # Iterate in reverse over remaining arrays, adding first element to result and deleting from array
    array.reverse.each do |elem|
      result_array.push(elem.first)
      elem.delete_at(0)
    end
    p array
    break if !array.any?
  end
  return result_array
end

array = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

p snail(array)