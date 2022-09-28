# def sum_pairs(ints, s)
#   result_array = {}
#   # [[value1, value2], [index1, index2]]
#   ints.each_with_index do |value1, index1|
#     ints.each_with_index do |value2, index2|
#       next if index1 == index2 || index1 > index2 || value1 + value2 != s
#       if result_array.empty?
#         value_index_comparison(result_array, value1, value2, index1, index2)
#       elsif !result_array.empty? && index2 < result_array[:indexes].to_a[1]
#         value_index_comparison(result_array, value1, value2, index1, index2)
#       end
#     end
#   end
#   return result_array.empty? ? nil : result_array[:values].to_a
# end

# def value_index_comparison(result_array, value1, value2, index1, index2)
#   result_array[:values] = [value1, value2]
#   result_array[:indexes] = [index1, index2]
#   return result_array
# end

def sum_pairs(ints, s)
  result_array = []
  # [[value1, value2], [index1, index2]]
  ints.each_with_index do |value1, index1|
    ints.each_with_index do |value2, index2|
      next if index1 == index2 || index1 > index2 || value1 + value2 != s
      if result_array.empty?
        result_array << [[value1, value2], [index1, index2]]
      elsif !result_array.empty? && index2 < result_array.last[1][1]
        result_array << [[value1, value2], [index1, index2]]
      end
    end
  end
  return result_array.empty? ? nil : result_array.last[0]
end

# Faster solution found online
# def sum_pairs(ints, sum)
#   seen = {}
#   for val in ints do
#     if seen[sum-val]
#       p "ALERT: #{[sum-val, val]}"
#       return [sum-val, val]
#     end
#     seen[val] = true
#     p seen
#   end
#   nil
# end


sum_pairs([10, 5, 2, 3, 7, 5], 10)
