def unique_in_order(iterable)
  if iterable.class == String
    array = iterable.split("")
    return handle_array(array)
  elsif iterable.class == Array
    array = iterable
    return handle_array(array)
  elsif iterable == nil
    return nil
  end
end

def handle_array(array)
  result = array.each_with_index.map { |item, index| array[index] == array[index + 1] ? item = "" : item}
  result.reject! { |item| item == "" }
  return result
end
