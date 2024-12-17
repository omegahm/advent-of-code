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

input = DATA.read

map, directions = input.split("\n\n")
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

puts "Part 1"
puts os

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

map, directions = input.split("\n\n")
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

  SCALE = 1

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
    print "\33[2K\rGenerating animation: #{((idx_dir+1).fdiv(directions.size) * 100).round(1)}% done..."
    img = Magick::Image.new(SCALE*width, SCALE*height)

    map[y][x] = "@"
    map.each_with_index do |row, y|
      row.each_with_index do |elem, x|
        SCALE.times do |i|
          SCALE.times do |j|
            color = case elem
            when "@" then "red"
            when "." then "white"
            when "#" then "black"
            when "[" then "blue"
            when "]" then "blue"
            end

            img.pixel_color(SCALE*x+i, SCALE*y+j, color)
          end
        end
      end
    end

    img_list << img
  end
end

if ENV["IMAGE"]
  puts
  img_list.delay = 0
  img_list.iterations = 0
  img_list.write("15.gif")

  `gifsicle -O3 --lossy=200 -o 15.gif 15.gif`
end

puts "Part 2"
puts boxes.sum { |box| 100 * box.y + box.x }

__END__
##################################################
#.O.O.O.#..O.....O..O#O.........OO...OO..O......O#
#..OO#...OO....O#O..O....O...#...O...#...O.O.O##.#
#.....#..O...OO.O.O.O.O#O..O..O.O...O.O.O......O.#
#..............O.#O.....#.#O.#....OO....O...#..OO#
#O.O....#.OO.O.OOO..O..O.OO.#..O....O...#..O..O..#
#.O...O..OO..#O......OO.O.O.....O.O#O.........O..#
#.O#..O.O..#.O.O.O..#.O.O.O#..O..O.O.OO...O.O....#
#......O.....O.O.OO.O..O..#O.........OO.........##
#......O.......#.......O......O..#OO...........#.#
#...O#O..O....OOOOOOOO....O...OO.#..OO...O......O#
#.O.#.O.#O....O.OO#..O..............OO..#....OOO.#
#..OO.##..#..O........O#.O..#.#.............O#...#
#.OOO#.OO.......OO.#O.O.O..O..#.O.O.O....##.OO...#
#..#O.OOOOOOOO..O......O...O...O#.#..OO..OO#....O#
#.O..O....#..O......#.#.O...O.O#.O.O#.O.....O##..#
#......OO.OOOO..#O#.#..O....O...O..O....O..#O..O.#
#..O.O..#......O....OOO.O#.OO.#..O........#....O.#
#...O................#.OO....#.O..O.#.O.#OO..##.O#
#.O.O.O.#.O.O.......O..........O...##OO.O.O......#
#.#.O...OO.O#OO.O...#...OO.OO...#......#.O#O.O...#
#.........O.OOO......O...#.#...OO#.O....OO.O.....#
#.....OOOO.....O.O..O.O.OO......OO.OOO#....O..OOO#
#...O..........O.O.O....O.O.......#...O..OO....O.#
#.O...#......O....O.#...@..OO.#O.O.#.O.O...#O.O###
#.#...OO...O#OOO.....OO..O...#O......O...O.OO..O.#
#O#O.OOOO.O.....O......O.....O...O.O.......OO..O##
#O.OOO..OO.OO..O..O...##......OO.OO..#O....#....O#
#.O...O.OO....O...O.O.OOO.O...O#..O.O.O..O..OOOOO#
#..#.OO.#O#....O.#O.#..#...##.......OO.#.#..O.OO.#
#.OO....O#......O.O..O....O..#O.O..OO..O#.O...OOO#
#...O...#OO.........O#O..#..O..O.#O...O.O#..OO#.O#
#OO....#...O#....O#.O#..O...O.....#.....O#O.OO.#.#
#..OO...#O.O.O.........O...O...O...O#.....OO.OO..#
#O...O..O.#....OOO...O..O...OO....O...O.....OO...#
#......O....OOOO..#........O..#O.OOO#....O.OOO..O#
#O.O...O..#..#..OO#...##O..OO##O.OO.OO.O..O..O..O#
#..O.O.O..O....O#....#..O.O.#O...OOO#OO.O.......O#
#.......OO.#.#.#.......O.##....O...O.OO.O#.O#....#
#.....O...O.#..#..O...#O.#..O............O.O#..#.#
#.#.O........O#.....O.O..O..O........#...O.O.O.OO#
##.O..OO..O..O..O..OO.#..OO...O.#O..#....#..O.#.##
#O..O..#.O..O.OOO..O..O..OO.O......O.......O..O..#
#...O###.OOOO................O...O..OO..#...O.#OO#
#..O...O..O....O.O.O...O.O.OO..OOOO.#...O#.OO...O#
#O.O.O......O.#..O.O#.O.OO..O#......O.#..........#
#O..O......#OO.......OOO.....O.OO....OOO.#.O..O..#
#OO.#..O.....O..........OO.OO..O.O..#.....#OO..O.#
#......O..O..O...OOO..OO....#....O.....O.###O....#
##################################################

^><><>^>vv<>^v^v<^<><<<>v<vv>><^<>>^>>>^><<v<><<>>v>>><v>v^vvvv<^v>><^<<><v>^^^^v^^>^v>vv<<v>v^v<<^<v^<^<>^^<^<<^<<<v<<>v^^v>^>v^v^^^^^<v>><<^vv>vvv><>^<v<v>>v><vv^vv^<v^<^^^<^<^<^v^>^<v<>^v<^>>>v>^^<<v<><v<><^>><v<><^>vv>vv^<<^><<<^><v<<v^<^>v>><v<>v^v><<>>v<>^^<vv^<^><vv><^<<v<v>^>v<^<>^<^<^vv<>^>^^vvv<><vvv>v<>^v<^v>v^>v><<vv<v<<^^^>>v>><v>v>>>v>vv<^<^<^vvv><><v^><v<^vv<<v<^>>>v<>^>vv<<vvv>v<^<v>>^v^v^><v><^^^><^<v>v<^v>^v<>vv>>>v^<v^^<^^v<^><><<<v>>><^<vvv^<<v>>^v^<^<>><^<<><>v><v^>^><><>vv^^><^>vv^vv<<<vv^><><^v^<v><v^^v>>^<<<<<<>^^<vv<>v>v^^<^<v^>^vv^>>^>>><>^>^v<>>>vv>vv^^v><>>^v<>v^>^v>^^^<<<>v<<>>>v><^>v<v<<<^^>><v<>^<<>>vvv>>>>^<<>^^>v<v>>^<><^<vv<<<^^<<v^vv>^^v^^v>^<v<^^^v^<^<^v>>^><><>^^^>v<>^^>v<^v^><<^^^<<>v<^><v^v<<<^v<^<>v^^v><v<v^vv^<v>v<vvvv<>vvv>^^vv>^v^<v^^<^^>^<v><>^<v^vv><<<>vvvvv^^<^>v^^><v><v<^vv<v^^^>>v^<v>>><vv^<v<<>v^v><^^v<^<v<<<>^><v<v<v<<v<>><^>vvv<^>^><v>^<^>^>>>v<<^^v><^><^^^>>^>^<v>v><>>^v^^v>^>>>>^^>><<^<<<^>>^<v^v<v^>^vv<>^^>^vv^<>><^><v><<vv^v<<^<<v<
<<<>><^<<^v<<v>vvv>><v><^v<v^^<vvvv>^^v^v^vv>v^v><>^<vv>^vv<><>>>v>>^^v>v^><<v^<v^^vv<^v>^vv><<v<v^^<>^<v<><^<<^^^<^<>><<<v<vv<>v^^<<^^^^^^v>v<vvv<<>>><^<<^vv>^>vvv<v<>>v>^>^^v^<>v^v^>^>v^><^<^<^>v<<>v<<<v>^<^^v<<^^^>^>^^^<<>>v<^<^v>^<^<<^>^^<vv>^^^>^<^^^v>^<<^v><^>>>>>^^<^v<v>>>><<^<>>>>^<^<v<>^^^v<<<vv>>^<v^<v^<<^v><<<<^<v<>vvv>>^v><>v^^>^><>v<>vv><^v>>v^^^^v>^<><><>>^>v^vv<^v^^<^>v^<>>^>^<v>^^>>^>>>>v>^><<vvv^>^vv^v^v<><<<>><>>^<^^^>^vv<<^^>^>vvv<>>>>v<^^v>vvv>><^<>^^vv<^vvv>>>>v^>v<^>v><<>^^v<^>v^v^<vv^<v^^>v<>^>^v><>>>^>^><v><v<<^>>>^v<>v<>>>><<v><v<<<v<v>^^^v>^<v^v<<<<^<vvv^v^v<v>v>v^^^^^>><<<^v<>v<><v<<v<<v<v^>v>^^v<^v^^<>v^v<v^>>^v^>^v^<<>^>v^^v>v>^vv>v<v><<^v^v>vv<v<<^<v^v<<v>><>^v><^v<<><>><>^^>>>v<<v<<^<><<<^<<<v>>v><><<vv>>^v>><>>vvv>^<^><<vv<<v<vv^v<<^v^v<vv<^><^<v^>vv<>v^^<>v>^<<<^<>v<v<v<v>^^vv<v^^v>^>^><v<>>><^<<>^>v<vv^vv<>^vv><v<>>^^<>vv>v><v^^>v><v^v>^>><^^>>>^>>^>^^^v<^>v^<>^>>>^<^v>^<v><>^<vv>vv<^vvv<>>^^><>^^<>><v^^<^>>v>>^vv<>v<<<<v>^<<<><^^^<<<>^<^^v^^^<>v<^v<^<
vvv<vvvv^>><^<v^^>^>v^v<^<>>v>>v<<^^v<<>>vvv^v^^<^v^<<v>^>^^<v<v^^>>>^v^><^v<>^<<^^>v<vv<v>><^><v<><^v^v<v>vv<<>v>^<<<v^<vv<><<^>><<v<v^><vvv^v^v><>><<><<v>><<vv^<vvv>^v^<>^vv>^<>^<v<<<<>vv<>>^^<<>>>v^^>v^<>^<v^^<^>><<>^vv>^>v>>^><>v^>^<vv<<vv>><v^v<<^^^>^^^>^<<><v>^<<><>^^<^<<^>^^v>^>^<><>><^vv<>vv^^v>^<^>vv>><>^>v<^v^^>^v^v<<<<^>v<>vv^<<vvv>v>>^^<><><<>>vvv<<^v^<^>>v^<>^^><^^^v>^<v<<<vvv><<<><^>><v>^>^<^>^><v^^<>>v^^vvvv^^^>>v^>v>>^<<vv^v^><<<^^v^^<<<^<>v<v^v<<^<><<v<<<v><^vvv^v<^<>^^v^>>>v><<^^vvv<<v<<v<v>^><>^v^^v<v^v<>>>>^vv<v^<^>>^^^^^<>v>^<<v^v<>v<>v>><><v^>v<<v<<>v^>^>>>^vv<>v<^><>vv>vv<><>>>>^<vv<>><>v<<^v^^>>>><>>v^^><<<v^<v<^>vv<>>^^^^<vv<<^<^<v^<<<^vv^^>>><>^v<<>^v<vv<^v<v<v^><>^>><^v>>v^v^>>^>>v>>^<>>>v^vv^<^<<<<^>><vvv^^^><<><v<^<<v>^^<vv<><v^>^v<>>^vv<v>^>^<v^>^v<^^v<v>>v^<<<>^vv^>^<v^^v^<v^>>><v<^<>^^^<^<vvv^<^>>><>>>v<>v>^v<v><>^^v<<>>v^><^<<>^^^^v><^v>^>>^v>>^<>vv^^v^^^>>^>>v>>v<<v^<^><>v^<^v<v<>^>v<>^>v<v^<><<v>><^v<<<^<v^><^><>^v<<<^<^>><^v<vv><v><v>v<<v^><>^^>v>>v<
><>>v^vvv^<^v<>^>>^<^>^v>>>vvv>><^<<^<>^^^<^^^>^^v>v<^<><^^v<>^v>><>v^>v^vv<vv<><^><<>v^>^^><>v<v>^^<>^>^^>vv<>>><vv<<v^^<<<<>^>^<<>v>^>^vvv<^<^^^vvv^>>>><<vv>^^<^>v^<v>><^v^<^v><v^^>><>v<vv^<><>v^^vv^<>>><>vv<^v>vvvv<^<v<^>>v^>>^<<v<v>^<vvv<^v>>vv^v<<v^^><<v<>^<<^>^<^vv<>^^v<<^^^<v>^^>^>^^>><<>^vv>>v^>><^v>vv<^v^>^<>v<v<>^><<<^v^>>v><>v<^^><v>v^><^>>v<v^vvv<<v^>^><<<>vv<><>vv^<^^>>^^<^<><<>>^>v^><>^vv<<v<>v^v^<>v<^v<^^<^<^v><<^v<^^v<v^^>^v>^^v^>v^>v><v><><v^<v>^^^vvv<<<v<vv<<>><^<^v<^vv^^>>^^v^>v^v^<><^<^>><>>^<<vvvv^<^^^<<^vv<^^<>v<v<^<<^><^<>vv>v><v>><><>v^^v<v<<^v<>>v><><vv>^^^<v<^<<v^^^>v<v>^><<v>>v^v>v<^vvv<<><>v>v<v><<^<^v^<<<>v<>v^<v>^^^><^>^<><v^>^^v>>^<v<><>^^^><v>v>^<>><>v><v<<<^vv>>^^v^v>>>v^<^<>>><^>v>vv<v>^vv><v<v<v<v>v^v<><^><<v>><vv<<<^>>>^vv<>><^^vv><v<>v^v<<>>^<^<>v^v^vv^>vv^^^vvvv<>^>>^^>v<^>^<^<^>vvvv^>>^v^^<^<>vv<v^<>^^vvv<vvv^>^v<>^>>v><><<>>v^^v<>^<<<>>v<<<><v^>v>v^<>>><v^>><^<v^^v<>v><<><>><<>vv<>>^v<<>>><>>v^^v^v^<>>>^vvv^<^^v>>^v^<^><<^>^v^><vv<<>>v<^^>^^>><<^
<v<<><<v^^^v^^vv<>>vvv<>^v>v<><><<<v^^>^^v^^^^<<<>><>^<^><v>>v>><<<^>^<<>^^><v^>>^><v>v>v^<<v^>v>>^<>>v><v><<^^v<v^>^<v<>>>^>>v><>>v><>v>^vv^^^<v<v<v<>v^^^^>^>vv^><v^^>^<>><<^<<v^^v<^v<^v^<>^>><v^<v^<>^^^<>vv>v<<v<v>^>^>^^>^^^><<>v>>^>v>v>^^<<^<><<>^>^^v^^^^v>vvvvvv<^<<>>v<<<v>^<<><vv<<^><vv<v^v<><^<^><v<^<^<v^<^^<^^>>^><v^><v^<^>v^v<>vvvvv<>v>vv<v>^^>><>>^v^v>^vv><v>v><<><^<>vv>v^<v>^v>vv>^^vv<<^<<^^>v<^vv><<<>v>^^v<><^<^^^^^<<<>^^<^v^^v>>>vvvvv<<<>vv<<^v<^vv<vv>v>^^v<^^>>^vv^v^v^>>v><^vv<>>^v^v<v>^>^v><>^>v<<v<>^v<vv<<<v<<<^>v>v<>v^>^v<>^<>><vv<>^<v<v^^v^^>v><<>^^v<^^<>vvv^v<<^>vv<<<^>^>>vv^><<>>v><v^<vv><<<><><^>><><><v<^v^v^^>>v^v<vv>v^vv><>v^^^<>>^<>^^^<<v^vv^>vv<^v<<v^v<v<<>^v<<><<^^v^^>v^vv<^>vv><v>>>vv^v^^<<^><>v<<<^v^^<><>v><^v<v>>v>^v<>>v>>v>^<^^v<<v><>>v<^v<^>v<^v><v<<^vv><^^<^^<<vv^>^<v<<<^>^>v>><>><v<v<>>vvv<<<vvv^v^>^v>><>><>vvvv<<v^v>v>vvv>^^^><^>>>v<vv^^v^v^<^>^^^<v<v^v><vv<^<vv>>^^v>>v><^v><vvvv>^>>><><<>>><<><<v>>^vv<v>^<v><v<vvv^v>>v><v<<^v^<>v>^v^>vv^^v<v^^^<^^<<vvv
>^<<^v<<><<^>^<<^^^<>vv>vv>vvvv><<<<><vvv<^vvv^<<<^><<<^>v^<^v>^><^v^><>^v<>^v>^v^v^^>>^<<v<>><<v<^><v>^<<>v>><vv>^>v^<v<<^>^<>v>><^v<v^<v^>^>><v^v^>vvv<>>^^>v^<<<v>^v<^vv^v<<<^vv<<^^vv<^<<<vv>>>v^><v^>v><>><><^^^v<^<v^vv><^v^v<v<<^v<>v<>^v^<<<^<<><<>^<^<>vv>v<<^<^v>vv^v<^<>>vv>><>vv><^^>v>>>^^<^vv<^><^^<^>>v<<>vv<v^v<>vvv><><v>^^<>^><^>^>><^<^v>>v<<v<<>^v<<<>v<>^^^<vv<<<^v<>>v^v>^<<>vv<<v<>>^v>^><^>^v^>>^><^>><^^^^vv^<^^><<^^<<<vv>v^^<v^^^<<^<v><^^vv^^<>>v<><<>v^v>v^vv<vv^v^^><>v^>^<>^<v^^><^<<<v>^^^<vv<^>^><<<^<>>^vv^<^<^^>^vv^^v<v^<^<<^>>>v><^v^<<v>^v<>v<vvv<v<v<<><v^^<>^^>v>^>^<><v^v^^v^v>vv>^^v><^<>>^^<^>^><^v<v<vvv^<v<^^<<>^^>v><<v^<<vv<v<^^<>v^<>>><^>vv><^<><^^>vv^>^>>>^v>>v<>><><>>^>>v^^v^^^<<>>v<>^<><v^^^v<^<<v^^^^<^^<^<>>^>><vv>^^v^^>><>>v^>v^>>vv^<>>^><<^>^^v^>>v<><v>v<v^<^>><^^v<^<v^>>>v><<vv^<><^<>^^vv^^^<<^vv^<^vvv<>^<>>v>^^v^>>v^^v<>>^v<<v^>><^^^vvvv^>^<<^<v>^v<<>><<^v<<<^><v<><>>^<v^^>v><^^v>v><>^^<v>v^v<v>>^>^^<>v>><<<v<<>>><>^>^<^v>>vv<<><^^^^>v^><<^^>^<>>>>><<<><vvvv
^v<<^>v>>^vvv<><^>v^>v^<v<v>^<vv<^v<^v^^v><^<^>>^><v>>><><vv^v<vv><<v<v^<<<v^v>^>^v><^>><^<>v>v<>^><<^<^<^v^v>^v>vv<^<<vv^<<><<>><>>><^<<^>^<v><v^>^>^<v>vv^>>^<v<<<<^<^v^^^><<v>v<v><^^><<vv<^<v>^^<>v^>v>vv^><^^vv^><vv><^>^><<^^^<^>^v>^vv>><>^v<^<>v<^^<^>>vv^^^<<>^^v^><>>vvvv>^vv>v<>^<^<v>^>^vvvv^<<<>v>><^><^v^>^vvv<<v<v>^^>>vv<^<^><<^<^>vv>^<^>>^v^>^<><>v<^<>^v>>^<<vv>^>v>v^vvvvv<<>v<v>^^>v>v^vv<><^<>v<^vvv<>>>^^^vvv>>v<v>>>>^v^v<^^^>v^^>^<>>^v<^<<>v>^<>v<vvvvv>^v^v^<><>v^>v<vv^><vv<>v><><<<><v^<<^^v>v<<^^v<<>>v^^^v<>^<^>v<^v<v^^v<^v^<<v<vv<>^>>^>><>^^^^>^>><<><>^^<>vvv>v<>^<vvv>^<^^<^>vv^<^<>^^vv>^>v<<v^vv>^>>>v^v<>>>>vvv^^<^^>><^v<<<^<>>>^^<>>v<^<v^^<<vv<<v^><<v<v>v^^>vvv<<>>^v^^^<v^v^^v>^<<^vv^^v<>v<^^<>v^>^<^^<v>v>^>^<v>>vvv<>v<^v^>>><<^<<^^<^>>>v<^^v^>><>><>v<><^>^><<^>v<<^^<v^>vv<^vvvv>^<vv^>^>^>><^<<>^<v<<>v<vv^<<>^v^<<^^<v<^v><>vvv^^^vvv^<v<<^v^^^^>>vv>v<v<<^^<><^^vvv^<^<v<vv><v>>^v^v<^>^<^^^v>^vv<^<>v>v^<v>>^<>><>><<>>v^>v>v><<<<v>vvvv^>^^vv<<vvv>>>v<<v><<v><^v^v^^>^<<^^^<<>v<
<vv<v^>><>^v<^<<v<>^^v>v><<v^^^^<<<<^<^>><v^^^vvv^v<><v<>^^v^><>v>^^>><v<vv<vv^v>>v^><>^>^<<^v^v>v<<^>^v<<^v>vv<^>>><v>^<>v^>>><^v<v<vvv>v<vv^<v^>^<<vv>><<^^v<<v<^^><<v><>vv>>^<^<>v>v>>>v^^<^<^v>^>vvv^^>^>^><^><v^>v^>^v^^<>vvvv^>>vvvv<^<>><^v<<>^<v^vv^><<><><^><>>^vv^v<^^>v<^>vv<>>v^^^^v<v^>v<<<<^^<>>>v>^v<v^v^v<^v^v<v^><<>vvvvv><<<v^<v^v^v>>v>v>v>v^v><^v<^>^^<>v<<<>^>><<^v<>^<>v<>>>^^v<><<^<>>>v<^v>>>>v^v^><^v>>^^vvv<^v<v>v>^^<>v^v>^<<>^>v<v>^<^>^v>v^v<v^^>>vv<^>><v>vvv^^^<>>^^>^<>><><^v>^<v<v^v<vvv<><<v<><vvvvv>>^^<><^v<<v><^^><vv>>>^<^^<v^<>>v>v^>^v>v>vv^^>v<v^v^^^<^v<^>v>vv<^<>v^^^^>>vv<<<>v^>^vv<v<^><<^v^^<v>v>^<>v<<>v^<v^^>>><<^^^^>^><<<<<v^v^v^vvv<<^><<v<v^><^<vv><^>^^v>>><v<<<<^^<>^vv<>^<>^^>vv<v^^^>vvv>^<>>><vv>>^^>v><>v>^>>^>^<<^^v<^<v<^<^^^v<^<v<^v^<>><^<><v^>^>>v<>>^^vv>>v>><<v^<vv>^^>v^<><<v<v<vv^>>><v<>^v>><<v><>v>^>v<^^<v^<v<^^<>^vv^v>v<>><^^v^^<>^^v^<v<<^^^>>>vv<<v^><v>v^<>>vvv<><>^^><<<v<^vv^>v<>^v<vv^><<<^^>>vv^>^v^>^<v^<^v<>>>^<>v><v>v^<^v<>^v<><^v^><v><v<v<<v^v^^>v<
>>^v><<^<<vv^<>v^v^<>>vv<>^><<<v>>>v^>^^<<v>v<v^v<^^>vv^<v^vvv<v^<^>>^<vv^<>><^vv<<vv^^><v<<^^>v>v>v>^<^v>^>^<^^^^>vv<<v<v^v<v<>^><>^<>^<v^v<v<v<<v>><><>vv<^v<>^^>^>v^<^v^^<^^^<<^<>^<><^vvvv>^<>^v^><<><><^^<>v<>^v<>>>v<v^^>^vvv^^^<><^^^<^^>vvvvv^^vv<>><<>v^^><^<<>>^><><^^<>^>v<<<>^<v><>^><v<>^>^v^^<<^<v^<><v<^^v<<>><v<^><vv^>^<>^<v>><>v^>v^^v<vv>v<<<>^<vv<^v^^v><^^<^<vvv^v^^^>>^<^>><<<>>v^>^<<<>vv><v^^v^<>vv<>^v^v><>><^^v>>>v^><^^^><>v<<v>><v<>>v<^<>>>vv><v><v<<<v<<^<^<^v>v^v>><v<^^^<>>^vv<^>^<>>v^><^<>>>v<^^v>^v^>><^><^<<><^^^>^>vv^>>^>>v<^^^<vv><<<>>^<>>>^^^^><v^vvv>v<^v<^>^vv>>>v^>vv><>v><><>^><v>>>vv^^>^<^^^v<^v>>vvv<v>^^^^><>vv<^>v>v<><>^^vv^v^^<>^^<^<>vv<>v>^<v<^><<>><<vv^>>vv^<v<^^>^<^^<>^^>>^^<><v><vvvv>>><^>v^><>^>v<<v^<^<<^^<^^^>^v<^><^>vv^>^><<^^><v^>>^<^v<<^^v>^>v^>vv^^<v>vv>>><><<><^v^<<<v^^^>^>>v^<vv^^>>>^>^v>>><>^v^^>>v<>vvvv^<^v^<^^^vv<<vvvvv>>^^^v<<^v^><<>^>>>^<v^>v>>vv><v^^v<vv>vv>^^<v^v<^v>^<>>vv^^^<^<<vv<vv>>>^v<>>vvv^^>^v^vv<<^<>^><^^^>><<v<><>^vv<<<<^<>v<^>>^v<^^v
<<>v<vv>^^>>v^^^^v^^>^v<v><^vv^vvv<v^^>^v>^^vv^^^^<^<<>vv<<^>>^^>>^>v>v^><^<<<vv^v^<<>><^>>vv<v>^^<^^v>v<v<v^<vvvv><^>>^^>>^v<^^vv>>>v^^<^<^^<vv^^>v^v><^v^vv^<<v^<^>>v<^>>v^^>>>>vv<^v^v<>v>v^^^^^^^>^^<^<>>^<v^>^^>v>>^^^<<^^^<>^<v^v^<<^v^vvv^>^vvv^^^v^<^>v^<<<^<^v<<<v^^<>^<<vv^<^v><v^<vv^vv<vv^><v^>^<<<^v>v^>v^<vv<<^^<<>>^^>>^<v<^v><^v>>^v^v^>>vv<<vv>v><<<^>><v><^>>v>v<^>vv^^>>vv^v^<vvv^<<v<vv^^v>v<>v><v^^^^v^v^v>v<><<>^vv^^^vvv>^v^v>v<>>^<>^vv>v^>>v^v>v>vv^>^>>>^v<<v><v><>^^<v>^^<v<<><^>^v<^>v>><<>^<^vvvv>v^<>^^v^vv^v^v>>vv^v<v^>>vvvvv^><v^>><v<v^^v>>>^<>>>vv<<<v>^><<<vv^^<<<>vv>vv<v<<>vvv<v^<>v><^<<<><^<^><v<^><^<^<>^><><>^v^<v^>>>v<vv^vv<<^^<>>vv>><<^<<<^v^<<>^<^<>>v^>v<>^^<>>v>>^<^^vv><v^<<<>v<<^v^<>v<>>^>>><vv<>vv^v<<v^><<^>>^>^><v<^>^vv<v<v>^<^><^v^>>^v>vv^v^<v^v^>^^<v^>>><^^^^v^>vvv^vv>v^v^^<^>>>^>v^<<<<^><^v^>v^v>^^<vv<v^^^^>vv>^^v<^<<>^<>v><><<>^v><vvvv<^v>^<^^>v<>^><v<>v<^>><<v^>>v^vv^v>vv^^<<>>v><>^>vv<>>>><>vv^v<>><vvvv<^^v<<v>v<><v^<v>^>^>vv^v>^vvvv>^<^v<<<<^v<^v^v<<^<<v>v>
^>v<^vv^^^>^>>><^>>>v>^>v>>>v<>>v<>^^<>^^^<^>^^<^v<^>>^><^>^^<^>v>>^^>v<<^^<<vv<^vvv<^v^>v<vv^>>><<>><<v^>>^v^^^^>>><>><<>>><^v>^^^^<>^<^<>^><<vv^v><^<^<<>>v<^^<<<<^<^<^<^^<v^<>v<>>>^v<^>><>^vv>^vv^^^<v>^<^vv>>vv<v<^>^<^^^^>^^<<^>v^^>^vv^>^>^v^>>v>vvvv>vvvv>>^><v<^<v>^^><^v^<^^<<^>^<<<<<^<>v^><<>v^<<v<<v>>>v>^<<^<v<<v<vvv^>><vvvvvv^v^vvv<v^><^^vv><>^<>^><>>v^<<^>v>^<vv>>>>v>vv^v<<>^v>^<>^>v^v>^>>>v<<vv<<<^^><>>><^v>^<v^v>v^vvv<v<^v^v<><>v>^v>vv^>><^>v>>>v<^>^<v<vv<<><v>vvvv<^>^<^^<v<><<v>vv<<v>v^^^<<^v<v>^>><^>^<<<<v>v>>><>>^>><<>^><^<<><v^^v^vv^v>v<v<>v>vv^><<>>v>><^<^^v^><<v^>^<><<><>v<<<v^<>>^v>><><<>^>><>v^>v^>vvv<>>^<>vv<^>vv>><>v><<><<<v^^>>v^v^^v<<<<v^vv>^^<>v>>^^^<><<^vv<>vv><^vv<^<v>^v<^>v^^v<vv<^^<^vvv^<^^v<<<><>v<<<^<<>vv><><^<>>^<>>vv<^^<vv>>><>vvv<>>^v><^^v>><<<^><>>>v^vv^^v^^<<<<^>^<^<<>><^>><>v>^^vvv^<^^<^^>^<>^^<>^><^v<^v<<v>v<>v^^v>^v^>^>^><vv^><<^^^<^^<<v<^><^vv>v^<^^>>vvv^><>>v>><^^<^v^v>>><<v<><<v<>^^>^<<v<>v^v^<>^><><><v<^<^vv^v><v>><^^v^<^<>v>><<>^<><^><^>^v<v^^<>
^^^>vv^v>^<v>v<>>>^v<v^<<v>>^^<<>v<><<^vvvv<v><^<>><>^<><><>v^^<<v<<<>^>>><>>vv^^>^>>^<<^v><>v<<v<><^>^^>>><<^>v^^^><v<^^>>><^^<^<^><^><<v^>^><^<^^v>^<<vv^^>^<<v^v^^^^^<<<<^v>>v^<<<>^v^v<v^>>><>v><<<^<vv^^^<^<^^>><>v<^vv<>^v<<v>^v^><vvvv<<>v><vv><<>^<>>^^>^<>>v>vv<<v^^<<^vv<v<<v>><^^>^vv>v>^<<><v>^v>^^><v^>>^>>><<v<^^<^v^vv>^<^^<^^>v<^^><<vvv<><^>>^vv^<>^v^<<v>v<v^vv^<^>v^v<^v^>^<<vv<>vv>v<<^<v<v<^>v><^>^v><<><>^>><<<^^>v><v<v^^>><v^v>>v<>v^v<^^>v^>>>v<<<v>vv>v^^^<v>vvv<v<>v<>>v>>v><<>v>vvv><<<^^<v><>v<^vv<>><^>>>v>><^>>^v><^>vv>>^vv<vvv<v>v<^><<^^>vv^^<>^v^><vv<>>>^<v^>>><vvv>>>>vv>>>v>^<^^<<>^<^v><>v<^^^<^^^v<<<<v>>><<<^v<^^^<^vvv<v>>>>^^^v<^<vv^^vv^><^>><<<^v^><<<v^vv<>^^^<^v^<>><><^^>^<<^v><<<vv<v<v^<^><>v^<<vv>>^<v>^^v^><vv>v<^><^v><><^><<v^>><><>v><^<^v<v<vv>vvv^^>^<<^<<^>^>^<<^<^^^v>>^v<>^><<<<v^v><<^>^vvv<v^^^<<^<v<^^vv<v^v<v^v^v^v<>>>>^v<v>v^><^^v>v^^<<^^<<><^v<><<^>>>>v<^^v<v>><<^v>><^v^<>v<<><>^><>^<<<^>v^^<vv<^^><v>^^v^v<v<<>^<>>><<v^v^v<<>>^<v<<v<^<>><v<v<v^v<vv>^>><>^v^^^
^<^^>>>>v<v>>vv>><<^v>^^v^v^^v^^vv>v<^^v<vv<>>^><<><^vv<^<vv>v<>^><<^v<><<>vv^^<vv>^>v<^>^v>vv^^^<^v^v^<<><v^v<vv>^^>>^^>^^v<^^v<<^<^^v^>>^<v>^><<v>^><>>v<^>v<^>>^vvv>v><<^><^v<v<<<<v<^^>>>v<v>>v>^<>v<^vv^^>>vvv^<v<>>>v<v^<<<>^>v^^><^>^><>>>^v>^^^v>^v<v>>^>>^<<><>>vvv<<^v>v>^<^<>vv^>>>>><^<v<<v>^>^><v^><^^>>>^^><^<<>^>>^>^><^<>^^v>^>^vv><v>><v>v^>vv^^^>^v^^<v>^<vv^<<>v^<>><>^^<^v>>^<v^><>v^v^v>vv><v^v>>^v<v<^<>>>^v^vv^>v<v^>><^<^<v<^<^<^v<^v<<>^v^<v><<<<>v^v>>v><^<vv>^^<<^v<>^v<>^<v<v^<<>><<^<^^vv><><^>v^>><<<>>^<<<v<<v>v^^v^v^^<v>v^^>^vv^>>v<<>vv>^v<vv>^<<vv^vvvvv<v>>^>><<^^<^^<^v>v^v^v^<^v<^v<v>v^<^v>>>^<^>^^^><<<><^^>>>v<>^>>v>>>v>^>v^<>><^<vv^<v><^>^v<v>><v<<^<<v^<^<<>^>vvv<^><v^^>^>><<<<>>v>>>><^^>vv^>>v^v^^v>>^><>v^^v><vv<<^v^><^<>^vvvv<^<>v^^^^<^<>><<<>^><v<^<^><v<<<<v^>^>v^>v^vv>vvv^<v^v><>vv<^<><>v>vv>^v^^vvvv^vv<^>><>^v>>>^<<^^<v>v^v><<><^^>v<^><^<>^>vv^^^^><^v>v><>v^>^vvv>>>>>^<^><v^vvv>>v^^>>>v>>vv^^>>v>^<^v^^>^>vv<<^v<<<vv>v>>v^><v<v<vv^>>vv^^v^v<^^vv>^v^>^^v<v<v>>^<vv<^<<
<<>>^>^>>v>vvv>^vv><^<vvv>>^^v>>^v<v^>>><<v<<v>^^>v>^>><<v><<<^^<><>^^>>^>v<>^<^>v>vv<^>^v<>>v<^>v<>^<^<^^vv^v<^<v<^>>v>>v><v>>><>v<<<^^<v<^>v<^vv>v<^v<vv^><^vv<><^<><<^v>>>^v>v^>^>>>vvvv>^>^^v^vvv>v<>^<^<^^>v<>^v^^v^<^v^^<v<>vv>vvv^^<v<><<<^^>v<>>^<^^^><^<<<^<^<v^>^>^<^^vvv<>v><vvvv>><>^>^^v^^>>v<vv>v>v>v>^vv>^<v<^><v^^<>^>^>v^v<^^v<>^>v>vvv>^<v>>^^>v<><v<^><^v>>>vv>v<^>>v>>^v<><^>vvv^<<^>v<>vv<>^^<v<>^<><>^<<^^>>vv><<v<>>>>>>vvvvvv^^>v<^^^^>>>>^<<vv^<^>v^^<^^vv^<^>v^><^^<<<>>^^><^v>>>><<^v^v<v<v<><<><^^v<v<^><<v^>^v><<>^><v^^^^>^>^<v<<>v<v>vv><<<<<><v^<^vvv><<<<^vv<<<^^vvvv>>>^<v<v^v>^>>>v>><<^v<<<vv><^<v>>vv>^<^<^>^^<^<<><^>^v>>^vv^>^v>vv>vv<<^^>^^<>v<><<>v>v^^><v^<>>v<>v^^^^<^><>>v^^>^<^^^vv^^><<vv>>^^v<><v<>v<v^<>vv>^^^>^^vv^v^v<^^<>^>>>v^^>^^<^><>vv>v>^v<<<^>^<>>>v<v^<v^>v^>vv<vvvv^<<<<v<>^^v<<>><^>vv><^vv>>v<>^^>>^v^^><^^>^^<<v^>^<>>^><v^<>v^<^v^^><^<v>v^v<^>><<v>v<^v^>vv<^>>v^v<^<^vv<^<<^v>v^v>v<^v^v>^^>>>^<><^>v>v^^<<>^<>>v^<><<^^<vv<<<v<v<<>v<><<>v^<v<<<^^>^<^v<v<><<>^vvv>^<<
^<vv^^>v><<v^<^vv<v^>v><>>>>>v>>vv<^<<v<v<>vv^<><<v<^v>^^><v^<><^>v<<^v><<vv^><^<>^^<>v<vv<<<^v>>^>vv>vv<^<>>vv<^<v>^>vv^^<^><><<^v<^><<^<>>vv<<<><>v>>v><><><>^^vvvv>^><vv<v>>^<<>v<<<^<<v<vvv^<>>^>v<<^v^><^><<v<>vv<><v><<^<v>vv>>^>v<<<^<vv>>>><v^<>v<^^v<v^^>v^<>>><>v><<<^<<v<<<^>v>><^vvv^<v<v><^>^v>^<v>><><v<<^><>^v^>v<v<^<>^<vv>^>v>^v>v>^>^v<^^><^v^>>>^<<^<v<v>><><vv^^<>v>^vv>>>>v><^>>^><^^<^^vvv<^v<<><<<<v^>^>^<<v>^<^>><v<v^<^^>^<v^<^<v^><v^^^vv><>^><>v<>>><vvv<<v>v^v>>v^<v>>^v><<<<^v>^vv^v>vvv<^><>>^>v<^v>^>^>vv<<>v^v^^>^>^v<<^v<>vv><^^v^<>^^^^>v<v^<<v>vv>><^v<<<<^v^>^v^v<vv<><^<<<>v^><^>v^^v><<>>v<^<<>>>v>^>^v>v^v<vv<^>^>vvv>>>vvvvv<>><<^^<>vvv<<v>v<<>v^^vv<<^^>v>^^v<>>>v><^><>v^^<><>><^>^>>>v^<><vv^^><><>vv^<v>>>v^v<>>v><<>><^^>v<^^<^v><><><<v<v<^^vvv<<^<><>>><v^>>^><<^<^><><^^>>v<<>^^^<><<<>v<^^v<vvv><<<v^>^^>vv<^^>>^>^^<^<<v>>v<<^v>^>><v^>>^<v>>>v><>>>v^>^v><>>v>><v<^^<^v>^v>v>^>^<<<^<^v<v<<><v^>^vvv>^<v>v^^<v>^v^>><vv^^^v>vv>v>vv>^>v^v^>>>><<^v^^>^v<v<v>^^v^vv>v^<^^><<^v^<>v><v
>^^v><<>><v^>>^>v<vv>v>^>v<<<<>>^>^<v^vv^<v>^<^<^v<<^v<>>v>^>>>^<>><<^^^^>^^<<^^><^<>v>>^<>><^v>><<^^v^^>v^^v^^>v>vv<v><^vv<>vvv<<v><v^v<<v^<>v^>>>v^^^^^v><^vvv<v^^<<v>^>><v^>v^<^v^<vv^>^<<^^^^<^v>v>v<^^>vv>^><>v^<v>v<>v<<v^v^v^^<^v^>v>>>v>>^>^^v<v><^vv>^^<<^>^v>^vv^<>^<v<<v><>v<<^><^v>>^>^v^<>>>^vv^>>^>>^><>>vv^<^><>^><^><<>>^^<<v><v^vv^><^<v^v^v>v><<<<v>>>>^>>v>><<>v<v^>v^><>>^v>v<>vv>>^>^v>>^v^<<^<v^<^><>vv^^v<v><>><><^>v>^^^^vv<>v^<<>>^><>^^v^v^<<>v>>v>><<>>^<^<^<>^^>^v<<<><^v<^<<<<v^<<<<^<v<>vv^<^^<^^v<v^^<^^v<^v<vvv<<^>vv<>><<<^>>^vv^<<>^v<>><<^>^^>><<><><^v<><><>vv>>>>v>^>^<>^<><v<v>>v^>v><v<v>^v><^>>v<<<<>^>v>v^>>^>^^^>v><<>v><v>>^<v>><<v>v^><<v>^>>^v<<<^v>v^^>^^^<v<<><v>^^<<>v^><^<<><v>^^>^><<^<>^<v^>>>^>v^<^^^>v>>><v<^>v>><v<><>>vv<vv>^^^v<>>^v^v><<<^^v<><>^<v><^^v>>>>^^v>v^>>>v>v^<v>vv^>v<^^<v<v^vv^<^vv<v<>>v>>v^>^vv^<v^>>>>>^^>^^v<^>>^^^>vvv<^>><<<vv>^<><<>v>^<^^^v^v>v<<^>v<>>><<<<v^>v>>vv>>^^^v>^v<><^>^<v<><>^^^<><>^>v><vv^v<v>v^^v<><^v^^v<<v<>>>v<v^<^^v^^><vv>^>>vv>>^<^v>
<<^<<><^<^v<<>>v>>v^vv^vvv>^>^v>>>>>>^>>^>vv><v^<><^>><<<^<vv>>>^>>>v^>><>^>v^^^<^<>^>^^vv>v<^<^>><<<v<v><>vvv^v^>v>^>^vv<>>^<>v^v<^>vv^v^^<^^vv>vv^<>^<^<<>^v<v^v><^<>^v^>v>^^><vv^<^>>>><>v^<^^<<<vv^v>>^^^><v^^>>^<v<<<<^><v^><^^><<>v>^v^><vvv^<<v^><^>vv^^^v<>><<<<^<>>>vv^><v>v^vv>v><><><><<<>^v<>v<v<>>^v<><vv>^v>v^^v<^<<><>>v^>>vv^<<<v^<v>>^v<>>>>><><<>^<^^<vvv>^^<<v>>^<^><^vv<><<><v^>>^<v^vv^<<<^>v^v^><^^<>^^^<>v<><<>>vv><<^<<vv>^>^<vv<^<>vv<<<v^v>^>>v>^>v^<vv>vvvvv>^^>vv^<^^<vv<>vv^^^^v^<>v>>>^v^^<>>v<>vv^v>>v<^>vv^v>>v^v<<>v>^v<>>><v>>v>vv^^^^^<<>^<>>><>>v^v<>v<>^^>>v<<^><v>><v^v^<v<<^>><>>v><^^<<><^<>^vv>><^>vv^^vv>v>>^^v>^v<>><^v^>>^<<<>^v^v<><^v^vv^^<>^>vv^^vv<<^v^>>^vv^^v^><<^<><<^^^^^><vv^^>v>v^^<<>><^>v>><><^^v><<<^<^vvvvv>><v<>v^>^<><>v><><>>^^<^^vv<^^vv^^v^v<>><v^^<vvv<>>v^<^<><^><<>>vv>^>>>^><v<v^><<>^^><vv><<>^^vvvvv><v^<><v>v>>vv^>>vv>^v><^v>>v^v^vv<<^^^^<v^<v^>v^<v><><<vv^v><<<v>vvvv>v^v><vv>><>>>>^>><>v>>v^><^^^>v^<<<^>v<<^^<>v<>v><vv><vv^vvv<<>v^v><<<v><<<<v^>v<v^v<^<v
^<<v<<v>^>vv^^^><<v>^<>^<<^<^><^v<<v<><<^^^v<^<^>^><<vvv>^^vvvv^^v<^><^^v>v<>><vv^v>>>>>^^^<<^v<^>^<><^vv>^v^>v^>><<v<^^^>v<>^>^><<<vv>^>v^>v^<v<<<><^v>>v><v^>v^vv^<>^>v>^>vv^^^>>>^>><vv<^v<vvv>>v<<^>>>><vv>><<>><v<>>>^v>>^>^<<v<<>^v>^^>^<<>v>>v<^>v>><><^>^<v<^>^^^v>^^^<^<vv<^v<v^^<v^<<^<v^v<^^vv<v<^>vvv<^>>v<^v<^>v^<^><^v><^vv>^>>^v>v><>^<^vv^<<^<vvv^v><<v<><<<><v<^vv^^<^^v>^^^<^v>^^<v^^><>><>v<v>v<v<v^>^>vvv^v>>><<<v^^>>vv><>>>v><v<^^<<><^^<>>>v<v>^<>>v^v>^v^^v<<vv>>^<<v^v>^^^^^>v^><v<v>^><><v>v^>>v^<^vv<<<>v<>^^>>>>>><<<v^^<<<v>^^<<v<^<^<>v^><^vv<<>><v^><vv^v^><^<>>^^>v^><<^>^<><vv>vvv^<^>v>vv<v<>v<^v>^>v^^>^<<>>>>><<><<>v<^v<^<v<^>v<^^<^>^>><^^^<^v>>^^^vv<^^<v<<^v^v^vv^<<<^^<><^>>>^<<<^v^><^v>v>><<>^^^>><v>>^><^<v^^v<>^^><^<^<v<v^>>>^v^<vv^^>^<^^<^v<>^v<>vv<^^<v><^^v>^v<^<<<>><v>><<><v<^v<<^><>^><><<>^v^<v>^^^vv^v>v^^^^<^vv<v^<<>v^vv<^^<<v<vv^<>v^^><^vvv>^<<><^v^><^v^v^vvvv<^^<>^v<<<vv><<^^<^<<^^<v>^>v><v^<^vv^vv>v><<>^<^<vv<<<v<<<><><^v^^v<>v>vv>><v>><^><v<<>^vv>v<<v^><^><<v><^^>v
<v>v><v>^>>v^^>^><vv><<<^v>^><v^^><v>vv>^v^<>^vvv>v<^<<>>v><<^^<<v>^<>><v^^v<^^vv>>>>vv><<<v>^<^^v>>^v>>v<v><v<><><vv<<^>><^>>^v><vv><v^<<><v^<><>^<v^>^^>v^<>><><^>^^>>^vv>^^^v>v<v><<^v<^>>v<v>>^<<vv^^v<>vv^<^^<^v<^<^><><v><v>>><<>^<><vv<<v^<v>^vv<<>^<>v^>^>^v^^><^>><^^<>^>>><v><^<v^vv^^<^v^^<<<<<vvv<<<>vv<v^v><v<vv<>^>v><^vvv<v<>v><><>><^>vvv^^v^<>v<<<<^>^<v<>v<><v><^^v^>vv^<v>^<v<>v>^<<<<^^vvvv^<^v>^^v^v>>><^^>^vv^<>><v^^^v>^^v>^v<vvv<v<<>^>>><v^>><<v<v^<>v^>^>^^v>^>v><^>v><<^v><v>^>v^<v>vv>^<<^^^^<^v<^v<v>^<v<><v<^><<^><<v^<^^^^<^vv<<<^v^>>><<v>>>^>>>><vv<<<><v^><^v<v<^<<>^>vv>^><<><><>>v<^<><>>>^vv>vv^<v<vv^<v>^<<<>vv^>v<v<vv^^^<^^v><^>>vvv>>^<v<^<v><v>><<<<<^<>^v>><<^<<^v>^>^^^^vvv<vvvv>vv^<v^^>>>vv^<>^v^>vv>vvv^^^v^v<v>^<^>vv^v><>vv>>^^^^v^>^<<<^>^<>v<^<>v^>v^<^v^><^^^>v^<v>^<><<><v^<vv^v<<<^<^^^vv^<>^>v<^^>>vvv>^^v<^><><^^^><<v<<^>><>^v<v^<^^><v^v<<<v<>vv>>^>>v<^^>>v>^<v><v^<v>^^v^^vv<^<>^<^<^^^v^>^>>v<<vv<v>v<><<v><<v<<<v<^^<<v>v<<^^<>>^^^<<^<>>v<v^<v>^^^^>><^^v>><>>>v<<v><v<<^
>><><<^^^v^^<><^>><>^<^^<<^v^v<<^>>><v^><<v><<<^>^<<v^v^^vvv^^><<>v^><>^^^<><<><^>v><^<>^vv^><vv<v^^<v<^vv<><v><vv<^<^><v<v^>^^>^v<>v^<<^^vvv<>>vv^<<v<^^>><><^^>vvvv>^>>>>>^>>>v^><v>^>>v<^^^<<v>^><>>^>><>^<<>vv<v>^<>^<<^<>^^<>vvvv^vv<<<>v><>^<^>>^<vv^vvv>v^v^<>>v^^>>v<v<><^^vv>vv<<vv^v>>>v^^vv><<>^v<><vv^<v>vv>^>v<vvv<vv^><><vv>^<^>^vv^<v>^v>v^^v<vv<><^<v^^v^><>^<<>v>^^<v>v><vv<>v^>>>><^v<<v<<vv>v^<v^v><v>v><vvv<v<^^>><>><<>^>>>^^v>^>v><^^vv>v>>><v>vvvv<v^v^vv<v<^>^^^<v<^>v<>><<>>vv^>^<v^^>v<<^<v<vv^^<^^vv^>v^v<^<vv^>>>><<<^>v><v^^><^<<^v>^v>^><>^^><>^<><>><>^vv>><vvvv<^^>>^^>^^vvv^<v>v^<>v<v<v^^<^^vv<^^><<v^^<^<^v>>v<v<>v<^<^v<vv<<^<<^^v>>v^^^>vvv^^^v<^^<<<^^<^^<>>>v^>^<^^v><>>>v^v><>v^<>vv^<<^>^v<>>vv>vv^vv>^^<>v^v>vv^<>><^^><>><>v<<^^>><>v^^^^<>^>v^^<v>v<^v^<>^>v>^>>>>>>^^><v<>v>>^vv>vv>><^>v><>>>>>v<<v^v>^^<>^v^^^^^v^<v>v<>v>>v>vv^><v<<<>>^vv^<<^>v<^^<^^<v>^v<v<v>>>vvvv>>>>>^<^^<<^v><^^><vv^<v<<>v^^v>^<^>^vvv<>>vv^v>^>>^^^>v>v<>>v^vv<<>^^<^vvv>^>^>^><v>v^<>^^>v<v^<<><>><><v^<v^^vvv
