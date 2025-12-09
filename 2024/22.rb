require_relative "../advent_of_code"

input = <<~INPUT
1
2
3
2024
INPUT

global_changes = Hash.new(0)
result = @input.split("\n").map(&:to_i).map do |secret_num|
  bananas = [secret_num % 10]

  2000.times do
    secret_num = ((secret_num << 6) ^ secret_num) % 16777216
    secret_num = ((secret_num >> 5) ^ secret_num) % 16777216
    secret_num = ((secret_num << 11) ^ secret_num) % 16777216

    bananas << secret_num % 10
  end

  changes = bananas.each_cons(2).map { |a, b| b - a }

  seen = Set.new
  changes.each_cons(4).with_index do |(a, b, c, d), idx|
    next if seen.include?([a, b, c, d])
    seen << [a, b, c, d]

    global_changes[[a, b, c, d]] += bananas[idx+4]
  end

  secret_num
end

print_part1 result.sum
print_part2 global_changes.values.max
