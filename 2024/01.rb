require_relative "../advent_of_code"

input = <<~INPUT.strip
3   4
4   3
2   5
1   3
3   9
3   3
INPUT

a, b = @input.each_line.map do |line|
  line.split("   ").map(&:to_i)
end.transpose.map(&:sort)

print_part1 a.zip(b).map { |n, m| (n - m).abs }.sum
print_part2 a.map { b.count(_1) * _1 }.sum
