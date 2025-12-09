require_relative "../advent_of_code"

input = <<~INPUT.strip
##########
#..O..O.O#
#......O.#
#.OO..O.O#
#..O@..O.#
#O#..O...#
#O..O..O.#
#.OO.O.OO#
#....O...#
##########

<vv>^<v^>v>^vv^v>v<>v^v<v<^vv<<<^><<><>>v<vvv<>^v^>^<<<><<v<<<v^vv^v>^
vvv<<^>^v^^><<>>><>^<<><^vv^^<>vvv<>><^^v>^>vv<>v<<<<v<^v>^<^^>>>^<v<v
><>vv>v^v^<>><>>>><^^>vv>v<^^^>>v^v^<^^>v^^>v^<^v>v<>>v^v^<v>v^^<^^vv<
<<v<^>>^^^^>>>v^<>vvv^><v<<<>^^^vv^<vvv>^>v<^^^^v<>^>vvvv><>>v^<<^^^^^
^><^><>>><>^^<<^^v>>><^<v>^<vv>>v>>>^v><>^v><<<<v>>v<v<v>vvv>^<><<>^><
^>><>^v<><^vvv<^^<><v<<<<<><^v<<<><<<^^<v<^^^><^>>^<v^><<<^>>^v<v^v<v^
>^>>^v>vv>^<<^v<>><<><<v<<v><>v<^vv<<<>^^v^>^^>>><<^v>>v^v><^^>>^<>vv^
<><^^>^^^<><vvvvv^v<v<<>^v<v>v<<^><<><<><<<^^<<<^<<>><<><^^^>^^<>^>v<>
^^>vv<^v^v<vv>^<><v<^v>^^^>>>^^vvv^>vvv<>>>^<^>>>>>^<<^v>^vvv<>^<><<v>
v^^>>><<^^<>>^v^<v^vv<>v^<<>^<^v^v><^<<<><<^<v><v<>vv>>v><v^<vv<>v^<<^
INPUT

# input = <<~INPUT.strip
# ########
# #..O.O.#
# ##@.O..#
# #...O..#
# #.#.O..#
# #...O..#
# #......#
# ########

# <^^>>>vv<v>>v<<
# INPUT

map, directions = @input.split("\n\n")
map = map.split("\n").map(&:chars)
directions = directions.chars.reject { _1 == "\n" }

x, y = [nil, nil]
map.each_with_index do |row, idx|
  row.each_with_index do |elem, jdx|
    x, y = [jdx, idx] if elem == "@"
  end
end

directions.each do |dir|
  map[y][x] = "."

  case dir
  when "^"
    if map[y-1][x] == "O"
      oy = y - 1
      oy -= 1 while map[oy][x] == "O"
      if map[oy][x] == "."
        map[oy][x] = "O"
        y -= 1
      end
    elsif map[y-1][x] == "."
      y -= 1
    end
  when ">"
    if map[y][x+1] == "O"
      ox = x + 1
      ox += 1 while map[y][ox] == "O"
      if map[y][ox] == "."
        map[y][ox] = "O"
        x += 1
      end
    elsif map[y][x+1] == "."
      x += 1
    end
  when "v"
    if map[y+1][x] == "O"
      oy = y + 1
      oy += 1 while map[oy][x] == "O"
      if map[oy][x] == "."
        map[oy][x] = "O"
        y += 1
      end
    elsif map[y+1][x] == "."
      y += 1
    end
  when "<"
    if map[y][x-1] == "O"
      ox = x - 1
      ox -= 1 while map[y][ox] == "O"
      if map[y][ox] == "."
        map[y][ox] = "O"
        x -= 1
      end
    elsif map[y][x-1] == "."
      x -= 1
    end
  end

  map[y][x] = "@"
end

os = 0

map.each_with_index do |row, idx|
  row.each_with_index do |elem, jdx|
    os += 100 * idx + jdx if elem == "O"
  end
end

print_part1 os

######
######
######

# input = <<~INPUT.strip
# #######
# #...#.#
# #.....#
# #..OO@#
# #..O..#
# #.....#
# #######

# <vv<<^^<<^^
# INPUT

boxes = []
class Box
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def can_move?(map, boxes, direction)
    case direction
    when "^"
      return false if map[y-1][x] == "#" || map[y-1][x+1] == "#"

      if other_boxes = boxes.select { (_1.y == y-1 && _1.x == x) || (_1.y == y-1 && _1.x == x+1) || (_1.y == y-1 && _1.x == x-1) }
        other_boxes.all? { _1.can_move?(map, boxes, direction) }
      else
        true
      end
    when ">"
      return false if map[y][x+2] == "#"

      if other_box = boxes.find { (_1.y == y && _1.x == x+2) }
        other_box.can_move?(map, boxes, direction)
      else
        true
      end
    when "v"
      return false if map[y+1][x] == "#" || map[y+1][x+1] == "#"

      if other_boxes = boxes.select { (_1.y == y+1 && _1.x == x) || (_1.y == y+1 && _1.x == x+1) || (_1.y == y+1 && _1.x == x-1) }
        other_boxes.all? { _1.can_move?(map, boxes, direction) }
      else
        true
      end
    when "<"
      return false if map[y][x-1] == "#"

      if other_box = boxes.find { (_1.y == y && _1.x == x-2) }
        other_box.can_move?(map, boxes, direction)
      else
        true
      end
    end
  end

  def move!(map, boxes, direction)
    case direction
    when "^"
      other_boxes = boxes.select { (_1.y == y-1 && _1.x == x) || (_1.y == y-1 && _1.x == x+1) || (_1.y == y-1 && _1.x == x-1) }
      other_boxes.each { _1.move!(map, boxes, direction) }

      map[y][x] = "."
      map[y][x+1] = "."

      @y -= 1

      map[y][x] = "["
      map[y][x+1] = "]"
    when ">"
      if other_box = boxes.find { (_1.y == y && _1.x == x+2) }
        other_box.move!(map, boxes, direction)
      end

      map[y][x] = "."
      map[y][x+1] = "."

      @x += 1

      map[y][x] = "["
      map[y][x+1] = "]"
    when "v"
      other_boxes = boxes.select { (_1.y == y+1 && _1.x == x) || (_1.y == y+1 && _1.x == x+1) || (_1.y == y+1 && _1.x == x-1) }
      other_boxes.each { _1.move!(map, boxes, direction) }

      map[y][x] = "."
      map[y][x+1] = "."

      @y += 1

      map[y][x] = "["
      map[y][x+1] = "]"
    when "<"
      if other_box = boxes.find { (_1.y == y && _1.x == x-2) }
        other_box.move!(map, boxes, direction)
      end

      map[y][x] = "."
      map[y][x+1] = "."

      @x -= 1

      map[y][x] = "["
      map[y][x+1] = "]"
    end
  end
end

map, directions = @input.split("\n\n")
map = map.split("\n").map(&:chars).map do |row|
  row.flat_map do |elem|
    case elem
    when "#"
      %w(# #)
    when "O"
      %w([ ])
    when "."
      %w(. .)
    when "@"
      %w(@ .)
    end
  end
end
directions = directions.chars.reject { _1 == "\n" }

x, y = [nil, nil]
map.each_with_index do |row, idx|
  row.each_with_index do |elem, jdx|
    case elem
    when "@"
      x, y = [jdx, idx]
    when "["
      boxes << Box.new(jdx, idx)
    end
  end
end

if ENV["IMAGE"]
  require "rmagick"

  img_list = Magick::ImageList.new

  height = map.size
  width = map[0].size
end

print "\033c" if ENV['VISUALIZE']
directions.each_with_index do |dir, idx_dir|
  map[y][x] = "."

  case dir
  when "^"
    if map[y-1][x] == "["
      current_box = boxes.find { (_1.y == y-1 && _1.x == x) }
      if current_box.can_move?(map, boxes, dir)
        current_box.move!(map, boxes, dir)
        y -= 1
      end
    elsif map[y-1][x] == "]"
      current_box = boxes.find { (_1.y == y-1 && _1.x == x-1) }
      if current_box.can_move?(map, boxes, dir)
        current_box.move!(map, boxes, dir)
        y -= 1
      end
    elsif map[y-1][x] == "."
      y -= 1
    end
  when ">"
    if map[y][x+1] == "["
      current_box = boxes.find { (_1.y == y && _1.x == x+1) }
      if current_box.can_move?(map, boxes, dir)
        current_box.move!(map, boxes, dir)
        x += 1
      end
    elsif map[y][x+1] == "."
      x += 1
    end
  when "v"
    if map[y+1][x] == "["
      current_box = boxes.find { (_1.y == y+1 && _1.x == x) }
      if current_box.can_move?(map, boxes, dir)
        current_box.move!(map, boxes, dir)
        y += 1
      end
    elsif map[y+1][x] == "]"
      current_box = boxes.find { (_1.y == y+1 && _1.x == x-1) }
      if current_box.can_move?(map, boxes, dir)
        current_box.move!(map, boxes, dir)
        y += 1
      end
    elsif map[y+1][x] == "."
      y += 1
    end
  when "<"
    if map[y][x-1] == "]"
      current_box = boxes.find { (_1.y == y && _1.x == x-2) }
      if current_box.can_move?(map, boxes, dir)
        current_box.move!(map, boxes, dir)
        x -= 1
      end
    elsif map[y][x-1] == "."
      x -= 1
    end
  end

  if ENV["VISUALIZE"]
    map[y][x] = "\033[31m@\033[0m"
    print "\033[H"
    puts map.map(&:join).join("\n")
    sleep 0.001
  end

  if ENV["IMAGE"]
    next unless idx_dir % 16 == 0

    print "\33[2K\rGenerating animation: #{((idx_dir+1).fdiv(directions.size) * 100).round(1)}% done..."
    img = Magick::Image.new(width, height)

    map[y][x] = "@"
    map.each_with_index do |row, y|
      row.each_with_index do |elem, x|
        color = case elem
        when "@" then "red"
        when "." then "white"
        when "#" then "black"
        when "[", "]" then "blue"
        end

        img.pixel_color(x, y, color)
      end
    end

    img_list << img
  end
end

if ENV["IMAGE"]
  image_name = "15-fast.gif"

  puts "\nWriting #{image_name}..."
  img_list.write(image_name)

  puts "Optimizing #{image_name}..."
  `gifsicle --scale=16 --optimize=3 --lossy=200 --delay=1 --loopcount=0 --threads=4 --output=#{image_name} #{image_name}`
end

print_part2 boxes.sum { |box| 100 * box.y + box.x }
