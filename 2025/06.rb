require_relative "../advent_of_code"

input = <<~INPUT.strip
123 328  51 64
 45 64  387 23
  6 98  215 314
*   +   *   +
INPUT

lines = @input.split("\n")

result = lines.map(&:split).transpose.sum do |eq|
  op = eq.pop
  eq.map(&:to_i).reduce(op.to_sym)
end

print_part1 result

columns = []
lines.map { _1.ljust(lines.map(&:size).max, " ") }.each_with_index do |line, i|
  line.chars.each_with_index do |char, j|
    columns[j] ||= []
    columns[j][i] = char
  end
end

result = columns.slice_when { _1.join.strip.empty? }.sum do |eq|
  eq.pop if eq.last.join.strip.empty?
  op = eq[0].pop
  eq.map { _1.join.to_i }.reduce(op.to_sym)
end

print_part2 result
