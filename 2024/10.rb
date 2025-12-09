require_relative "../advent_of_code"

input = <<~INPUT.strip
89010123
78121874
87430965
96549874
45678903
32019012
01329801
10456732
INPUT

map = @input.split("\n").map { _1.chars.map(&:to_i) }
trailheads = []
map.each_with_index do |row, y|
  row.each_with_index do |elem, x|
    trailheads << [x, y, 0] if elem == 0
  end
end

def out_of_bounds?(map, x, y)
  x < 0 || y < 0 || x > map[0].size - 1 || y > map.size - 1
end

def score(trailhead, map, part_2: false)
  queue = [trailhead]
  score = []

  until queue.empty?
    x, y, height = queue.pop

    if map[y][x] == 9
      score << [x, y]
    else
      queue << [x + 1, y, height + 1] if !out_of_bounds?(map, x + 1, y) && map[y][x + 1] == height + 1
      queue << [x, y + 1, height + 1] if !out_of_bounds?(map, x, y + 1) && map[y + 1][x] == height + 1
      queue << [x - 1, y, height + 1] if !out_of_bounds?(map, x - 1, y) && map[y][x - 1] == height + 1
      queue << [x, y - 1, height + 1] if !out_of_bounds?(map, x, y - 1) && map[y - 1][x] == height + 1
    end
  end

  part_2 ? score.count : score.uniq.count
end

print_part1 trailheads.map { score(_1, map) }.sum
print_part2 trailheads.map { score(_1, map, part_2: true) }.sum
