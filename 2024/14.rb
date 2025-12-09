require_relative "../advent_of_code"

input = <<~INPUT.strip
p=0,4 v=3,-3
p=6,3 v=-1,-3
p=10,3 v=-1,2
p=2,0 v=2,-1
p=0,0 v=1,3
p=3,0 v=-2,-2
p=7,6 v=-1,-3
p=3,0 v=-1,-2
p=9,3 v=2,3
p=7,3 v=-1,2
p=2,4 v=2,-3
p=9,5 v=-3,-3
INPUT
width, height = 11, 7

coords = []
@input.split("\n").each do |line|
  coords << line.scan(/-?\d+/).map(&:to_i)
end
width, height = 101, 103

100.times do
  coords.map! do |(x, y, dx, dy)|
    x = (x + dx) % width
    y = (y + dy) % height

    [x, y, dx, dy]
  end
end

groups = coords.group_by do |(x, y)|
  if x > width/2 && y < height/2
    1
  elsif x < width/2 && y < height/2
    2
  elsif x < width/2 && y > height/2
    3
  elsif x > width/2 && y > height/2
    4
  end
end
groups.delete(nil)

print_part1 groups.values.map(&:size).reduce(&:*)

coords = []
input.split("\n").each do |line|
  coords << line.scan(/-?\d+/).map(&:to_i)
end

seconds = 0
loop do
  seconds += 1

  coords.map! do |(x, y, dx, dy)|
    x = (x + dx) % width
    y = (y + dy) % height

    [x, y, dx, dy]
  end

  other_coords = coords.each_with_object(Set.new) { |elem, set| set << elem.first(2) }
  if coords.any? { |(x, y, dx, dy)|
    other_coords.include?([x+1, y]) && other_coords.include?([x+2, y]) && other_coords.include?([x+3, y]) &&
    other_coords.include?([x, y+1]) && other_coords.include?([x, y+2]) && other_coords.include?([x, y+3])
  }
    print_part2 seconds
    break
  end
end

map = []
height.times do |y|
  map[y] = []
  width.times do |x|
    map[y][x] = " "
  end
end

coords.map do |(x, y, _dx, _dy)|
  map[y][x] = "\e[38;2;0;255;0mX\e[38;2;255;255;255m"
end

puts map.map(&:join).join("\n")
