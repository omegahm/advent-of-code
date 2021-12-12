require 'set'

input = File.readlines('day21.input').map(&:chomp)

all_ingredients = []
hash = {}
input.each do |line|
  ingredients, allergens = line.scan(/^([^(]+) \(contains (.*)\)$/)[0].map { |m| m.split(/,?\s/) }
  all_ingredients.concat(ingredients)

  allergens.each do |allergen|
    if hash[allergen].nil?
      hash[allergen] = Set.new(ingredients)
    else
      hash[allergen] = hash[allergen].intersection(Set.new(ingredients))
    end
  end
end

marked_allergens = {}
until hash.values.all?(&:empty?)
  # Find singleton value
  selected_allergen = hash.select { |_, set| set.size == 1 }
  found_allergen = selected_allergen.values[0].first
  marked_allergens[selected_allergen.keys[0]] = found_allergen
  # Remove from all other lists
  hash = hash.map do |key, set|
    [key, set.delete(found_allergen)]
  end.to_h
end

puts all_ingredients.reject { |value| marked_allergens.values.include?(value) }.count
puts marked_allergens.to_a.sort_by(&:first).map(&:last).join(',')
