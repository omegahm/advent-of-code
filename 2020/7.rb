require 'set'

input = File.readlines('day7.input')

# PART 1
bag_rules = {}

input.each do |line|
  line = line.gsub('bags', 'bag')
  lhs, rhs = line.strip.split(' contain ')
  bags = rhs.chop.split(', ').map do |bag|
    _, amount, name = bag.split(/(\d+) /)
    { amount: amount.to_i, name: name }
  end
  bags = [] if bags[0][:name].nil?
  bag_rules[lhs] = { bags: bags, shiny_gold_bag: bags.map { |b| b[:name] }.include?('shiny gold bag') }
end

bags = bag_rules.select { |_, value| value[:shiny_gold_bag] }.keys
found = Set.new
bags.each { |b| found << b }

until bags.empty?
  bag = bags.pop
  new_bags = bag_rules.select { |_, value| value[:bags].map { |b| b[:name] }.include?(bag) }.keys
  new_bags.each { |b| found << b }
  bags.concat(new_bags)
end

puts found.size

# PART 2
def search(bags, amount, name)
  return amount if bags[name][:bags].empty?
  amount + bags[name][:bags].sum do |b|
    amount * search(bags, b[:amount], b[:name])
  end
end

puts search(bag_rules, 1, 'shiny gold bag') - 1
