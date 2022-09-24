def cakes(recipe, available)
  lowest_ratio = 0
  counter = 1
  recipe.each do |recipe_ingredient, value|
    if available.key?(recipe_ingredient)
      ingredient_value = available[recipe_ingredient]
      current_ratio = (ingredient_value / value).floor()
      lowest_ratio = (counter == 1 ? current_ratio : new_ratio_if_lower(lowest_ratio, current_ratio))
    else
      return 0
    end
    counter += 1
  end
  return lowest_ratio
end

def new_ratio_if_lower(lowest_ratio, current_ratio)
  return current_ratio < lowest_ratio ? current_ratio : lowest_ratio
end
