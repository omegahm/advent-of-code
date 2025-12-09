require_relative "../advent_of_code"

input = <<~INPUT
#####
.####
.####
.####
.#.#.
.#...
.....

#####
##.##
.#.##
...##
...#.
...#.
.....

.....
#....
#....
#...#
#.#.#
#.###
#####

.....
.....
#.#..
###..
###.#
###.#
#####

.....
.....
.....
#....
#.#..
#.#.#
#####
INPUT

input = @input.split("\n\n").map { |part| part.split("\n") }
keys, locks = input.partition { |parts| parts.first == "....." }

keys.map! do |key|
  key[1..-1].map(&:chars).transpose.map { _1.count("#") - 1 }
end

locks.map! do |lock|
  lock[1..-1].map(&:chars).transpose.map { _1.count("#") }
end

result = 0

keys.each do |key|
  locks.each do |lock|
    result += 1 if key.zip(lock).map(&:sum).all? { _1 <= 5 }
  end
end

print_part1 result
