list = File.readlines('day1.input').map(&:to_i)

# PART 1
# n = 2

# PART 2
n = 3
result = list.combination(n).select { |arr| arr.sum === 2020 }
puts result.first.reduce(:*)
