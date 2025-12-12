require_relative "../advent_of_code"

input = <<~INPUT.strip
0:
###
##.
##.

1:
###
##.
.##

2:
.##
###
##.

3:
##.
###
##.

4:
###
#..
###

5:
###
.#.
###

4x4: 0 0 0 0 2 0
12x5: 1 0 1 0 2 2
12x5: 1 0 1 0 3 2
INPUT

*shapes, regions = @input.split("\n\n")
shapes = shapes.map do |shape_block|
  shape_block.count("#")
end

regions = regions.split("\n").map do |region_block|
  size, count = region_block.split(":")

  [
    size.split("x").map(&:to_i).reduce(&:*),
    count.split(" ").map(&:to_i)
  ]
end

result = regions.count do |(region_size, region_count)|
  region_count.zip(shapes).sum { _1 * _2 } <= region_size
end

print_part1 result
