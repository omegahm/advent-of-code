require_relative "../advent_of_code"

input = <<~INPUT.strip
............
........0...
.....0......
.......0....
....0.......
......A.....
............
............
........A...
.........A..
............
............
INPUT

map = @input.lines.map(&:chomp)

antenna = {}

map.each_with_index do |row, y|
  row.chars.each_with_index do |elem, x|
    next if elem == "."
    antenna[elem] ||= []
    antenna[elem] << [x, y]
  end
end

def slope(ax, ay, bx, by)
  [bx - ax, by - ay]
end

def out_of_bounds?(map, x, y)
  x < 0 || y < 0 || x > map[0].size - 1 || y > map.size - 1
end

antinodes = []

antenna.keys.each do |key|
  antenna[key].combination(2).each do |(ax, ay), (bx, by)|
    sx, sy = slope(ax, ay, bx, by)

    antinodes << [ax - sx, ay - sy, key] unless out_of_bounds?(map, ax - sx, ay - sy)
    antinodes << [bx + sx, by + sy, key] unless out_of_bounds?(map, bx + sx, by + sy)
  end
end


print_part1 antinodes.uniq { |(x, y) | [x, y] }.reject { |(x, y, key)|
  antenna[key].include?([x, y])
}.size

antinodes = []

antenna.keys.each do |key|
  antenna[key].combination(2).each do |(ax, ay), (bx, by)|
    sx, sy = slope(ax, ay, bx, by)

    (0..).each do |i|
      break if out_of_bounds?(map, ax - i * sx, ay - i * sy)
      antinodes << [ax - i * sx, ay - i * sy]
    end

    (0..).each do |i|
      break if out_of_bounds?(map, bx + i * sx, by + i * sy)
      antinodes << [bx + i * sx, by + i * sy]
    end
  end
end

print_part2 antinodes.uniq.size
