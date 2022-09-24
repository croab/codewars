def cakes(recipe, available)
  lowest_ratio = 0
  counter = 1
  recipe.each do |recipe_ingredient, value|
    if available.key?(recipe_ingredient)
      # check if lowest_ratio has been given value yet or not
      # if it has and if new ratio is lower, replace
      # Otherwise lowest_ratio doesn't change
      ingredient_value = available[recipe_ingredient]
      current_ratio = (ingredient_value / value).floor()
      lowest_ratio = (counter == 1 ? current_ratio : new_ratio_if_lower(lowest_ratio, current_ratio))
    end
    counter += 1
  end
  return lowest_ratio
end

def new_ratio_if_lower(lowest_ratio, current_ratio)
  return current_ratio < lowest_ratio ? current_ratio : lowest_ratio
end

cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>1700, "flour"=>20000, "milk"=>20000, "oil"=>30000, "cream"=>5000})

# describe('static tests') do
#   it('basic recipes') do
#     Test.assert_equals(cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}), 2)
#     Test.assert_equals(cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>1700, "flour"=>20000, "milk"=>20000, "oil"=>30000, "cream"=>5000}),11)
#   end

#   it('missing ingredient') do
#     Test.assert_equals(cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000}),0)
#   end

#   it('not enough ingredients') do
#     Test.assert_equals(cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000, "apples"=>15, "oil"=>20}),0)
#   end

#   it('no ingredients available') do
#     Test.assert_equals(cakes({"eggs"=>4, "flour"=>400},{}),0)
#   end

#   it('exactly enough ingredients for 1 cake') do
#     Test.assert_equals(cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},{"sugar"=>1, "eggs"=>1, "flour"=>3, "cream"=>1, "oil"=>1, "milk"=>1}), 1)
#   end

# end
