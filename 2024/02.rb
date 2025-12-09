require_relative "../advent_of_code"

input = <<~INPUT.strip
7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9
INPUT

lines = @input.split("\n").map { |line| line.split.map(&:to_i) }

def check(line)
  dir = line[0] - line[1] > 0 ? :> : :<
  line.each_cons(2).all? { |a, b| a.send(dir, b) && (a - b).abs.between?(1, 3) }
end

result = lines.count { check(_1) }
print_part1 result

result = lines.count do |line|
  line.combination(line.size - 1).any? { check(_1) }
end
print_part2 result
