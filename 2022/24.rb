example = <<~INPUT
#.######
#>>.<^<#
#.<..<<#
#>v.><>#
#<^v^^>#
######.#
INPUT

input = <<~INPUT
#.####################################################################################################
#>>^<^v>v<>^>>v<<.<<<^<vv^<^>v><^<v>><^>.<><^^>v<^>v>^^>v><v.^<.^>>>^>v^^^<vv^<><vvv>v>^vv<<>v^^<v><>#
#>^>^><^v<>.v><><<<>><v><>vv^.><v^<^v^>v<<<v..<v.v^v.v<<v<>>^^<v^v.<^.^v><^v^.^^<v>..v<^>^<<^>.v.>v.>#
#.>^>v<v^><v<v^><>^v>><>v<>^><>v^<^v<>v<>^<v<><^^v.v.>^^.v<<^v<>>.v>>v<^^.v<v^<^>>..>><<v.^>.<<<^v.^>#
#<>^^^..v^^v^<<><<<^<>.>.vvv.v>^^.><.^>>>v^^>^^vv>v<^v>>^^<v>v^<<^>..^v^<>>>>>.>>><v^^^vv<>v^v<>^^.<>#
#>v^vvv><>>v^v.v><v<<^.>.>>^<.^<^<>><^<><^>v.>v<>v><<>>><^v<.>v<^v<v^..<vv><><.^^^^<^.<v<<^^>>v^>^<><#
#>^>^>^<<>^><<v^^^^^^^v^<<>>v^^>v>v<.><><^v^<v>>>>^<..>v<.^v><^<^v>v^^vvv^v^<v>>.^<<<.^^vv>vvv>^..<v>#
#><vv.vv^v.>^>>v<<<v^>>^^>><v<<.^>>v>v^.<v<vv<<<.vv^<>^.<v>vv<.>^^v><><^<v<^><.^vv^^<><<.vv^<v<<v.v^>#
#<^<v>.>^v^<v^^><vv.>>.<^>.^..><v^<<v^<^<<.<v<^v^v<^<.<<v<^v>^<<^v<>^<^v>vv^>vv>^<v.>^><v..>><v^<^^^>#
#>^><v><<<>><^v^>v<><>v^><.v>>.>^v<.^><vvv<.>v<v>^>>v><^^^v^.v>^.^^>^v>>v^v<^v>.^.<^>^^v<.<<v^..<<.v>#
#>vv>^.<<>><^>.<^><v<^<>>v><v>^.>v^<><.v.>^>>^><<v>^v..<^^^<vv^..^^<<<.v<<v<vv^v^<^><><v>.<<><^<v<^<<#
#>^>v<^v^.<<v<<^^>^<>vvv<v^>^<v<.^v^>><>vv<>v<.^^>^<>>><>v<<>.>^<<>vvv^v.v<><<>^.v.>^><^^>>^>>><>v.^<#
#>^<.^.<>v<.<^v>v<^^<>^>vvv..v.^><<^<.><...<.^>^>^vv<>v^^><<v>v^^<^^><<^>>vvv^<^^v>>vv<v<><v^<^v<^v^>#
#.>>^.v<>v>><<..vv>^.>>^>^^.v>v.<^><>v<v^^><<v<.>>^<v<<><>.^<<.>>^<v<>v^>><v>^>..v<^<^.vv<>^^>>>v^>v<#
#<>^^^<v><^v^vvv>^v^v><<>>^<vv^><<v.>>v>.v>^>>v<^vv.<><<>><<v<>>^.<<>v.v^^vv<.>^<^v.<^<vvv^v.vv><vv.>#
#>vv.vv^><v>v>.<v^><v<vv^v<.v<<>^<^>^><v^>v>^<v><>v>>v>>>>v^.<v<vv>^v<^.^.^>>><>^<^<^.<v<.><v.^<^.><.#
#>^vvv<>^v^^>^<^v<^>v<<^<vv.vvv<<<v<v^..^.<<v<<<>>^>v^v^>^><v.^<v<<v>^^v<v.>>>v^<v^<v>^<^^.>v<^<>^.v<#
#<>^<<<<v<>^v>v^<vv<^v>v^^<>.^>^^<.>>v>v<<^<<<>v<v^v><>>.<<.^<>><<<v>v^>v^^<v^^.><vv>^^<v.v>^<v<.vv><#
#<>vvv<^^.v^^.v.<^<^>.^^v>^v>>.vv.>.v<<^<^^>vvv^<<<vv^<vv<>>v^^<^.<^.>v.^>v><^^>>^>^<>.>.^<<<.v.<>^>>#
#><>v<>>>><.^v>v><v>^<<><>^vv.^.<.>>vvvv><>^^><>v>v.^^<^<^v>v<^<.<^<>^^^^vvv>.>>><^vv<^^^>.^<<v^>>><>#
#<<><^>>^>^^>><.v^^^.v^^^>.^v<vvv.^^<^^>^<>>><<>>><<.v<^>><<v<v^>vv^<>vv.<<>v<v^><<vv^^^>vvvv<<v<><<<#
#<^<><>><<>^^>v<<^v<v>^^^>^^vvvv<^^vv<>><.<^^.vv^>>.<>^.v<><^^vv>^^>>^<^^v>.v<>>^v.v^>.^v<.<v.<>>>>v<#
#<^<<^^^vv><^<>^^>^v<v^v^.<v.>v>><<^^>v^>v>><v<<><>^^.vv^><.^>vv^v<<>^><^>^>^v^<><>^.^<.^.^>>^<.>^><<#
#>^.<<v>^.<<<^>v>>>^<.^>>>.^^<<^.v^<<>v^<<<^<><>^vvvv^>vv^^>.>>^>><>^^^^>v<^^>^^<^vv.v.^<<^<<^>v><.>>#
#>vv^.^vv>^<>^v.^^<v>v>><^^^v<<>>^>>^^>^<^<<<^.v><^>v<<v^<^^^>vv><<v<.<v><^vv>^>^v^<^v>^<^vv<<^v<.^^>#
#<v>vv<^>v^^<<^^<<<v>v><<<.v^>^<><vvv^>.^.v>v<^^vvvv>>^v^^v^^^<>>>>v>>^>v^.<>.>.^vvv^<^<.<^>^<.v<><.>#
#.<.<^v<v><^>.^.v<>>^<>.<<^.vv^>v^v<..>^.^^vv^><.<>^<><^vv>^<.<>v..<^^<v^^v<<<v<><<>>vv<>^^<>^vvvvv><#
#<.^v^>vvv<.v<.vv><^vv^>>.^>><><<v>v<^<<vv.<>v<vv^v>^>^^<v>^>^<<>^<<^>.v^^^><>.^^v>^...^<^>>>.>v^^vv<#
#.<^v>^>^^<^v.v>.^<><<<>>vv>.^v<>.<<>>v^v<v>>^.^<^^<.v^<><vvv>><^.>.vv<.vv^>^><<.<.>><^>vv^^>>v^>^>.<#
#.>^<>><v<.>vv<>>^<v.>^.<v^v.v<><>^<v^<v.<<^v<>v<<v>v^>^>v.>>v^.><^^.>v<v.v^.>^^<>^<.^<v^^><<>^vvv>><#
#.^.^vv^..^>.v.<<v>^^^>^<^v<^>>v<>v>.<><>>.<v^<^>.<v.^^v^<v><>^>v.<^<<><>v.<<<^>.<<.^>^>^<^.>^v>>>.>>#
#.^v>><>v<<.<^>^^<<>^>v>vv<>>^>>^.v^>.>^<v^v>>v^^><.v.<v>.>vv<<^v<v<v^v>v<v<.^<.^<<v>^^v.^v.<^>.v>^>>#
#>^v>^<<>>vv>^<.<v^v<^>>^v>^v^<<><<^^^^v>^^^^^^^vv<^..<vvv><^.<..^>^^<^>v^>>>>vv>v<<<<>.>.>^.^<^.v<v>#
#.^v.^>><.><<v^>^^.>><^v<..>..><.><><<v>>>v<>^.>v<vv^^<<.^.^^v<v..^<v^>.<vvv>^>v>^<^><>>>>v<>^>>vv^.>#
#<v<vv^vvv><v^<^>>.v^v^>><.>><>>v^^<v>>>>.v^.^.<vv.>>>^v>^<>v^.^>v<vv.>>vvv^v^<vv<>v<^<^.<<^..v^.^v<<#
#<.<v>^>v<^<.<><>.v<<^v<^<>^.vv<v<<v>v<^<^v>v<v^^vv<><..v<<<<.^^v<>>^<v>.^>>v<^>v>^><vvv<^>>.^v>^<.><#
####################################################################################################.#
INPUT

def parse(input)
  grid = []

  input.lines.map(&:chomp).each_with_index do |line, y|
    grid[y] = []
    line.chars.each_with_index do |char, x|
      grid[y][x] = [char]
    end
  end

  grid
end

def visualize(grids, prev, source, sink)
  x, y, z = sink

  path = grids.map do |grid|
    grid.map do |row|
      row.map do |cell|
        if cell.any? { |c| /[<>^v]/ === c }
          "🌪️"
        elsif cell == ["."]
          "⬜"
        else
          "⬛️"
        end
      end
    end
  end

  path.map! { |grid| grid[source[1]][source[0]] = "🏡"; grid }
  path.map! { |grid| grid[y][x] = "🏁"; grid }

  while (prev[z] && prev[z][y] && prev[z][y][x]) || (x == source[0] && y == source[1] && z == source[2])
    node = prev[z][y][x]
    break if node.nil?

    path[z][y][x] = "\033[48;2;255;0;0m🧝🏻\033[m"
    x, y, z = node
  end

  path.each_with_index do |grid, i|
    print "\033c"

    grid.each do |row|
      puts row.join
    end
    puts
    sleep 0.2

    if i == 0
      puts "LETS GO ALREADY!"
      sleep 2
    end
  end

  puts "Uhm, I forgot my snacks."
  sleep 2
end

$memo_blizzard = {}
def move_blizzard(grid)
  $memo_blizzard[grid] ||= begin
    new_grid = []

    grid.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        cell.each do |char|
          case char
          when "#"
            new_grid[y] ||= []
            new_grid[y][x] = ["#"]
          when "."
            # no-op
          when "^"
            if grid[y-1][x] == ["#"]
              new_grid[grid.size - 2] ||= []
              new_grid[grid.size - 2][x] ||= []
              new_grid[grid.size - 2][x] << "^"
            else
              new_grid[y-1] ||= []
              new_grid[y-1][x] ||= []
              new_grid[y-1][x] << "^"
            end
          when ">"
            if grid[y][x+1] == ["#"]
              new_grid[y] ||= []
              new_grid[y][1] ||= []
              new_grid[y][1] << ">"
            else
              new_grid[y] ||= []
              new_grid[y][x+1] ||= []
              new_grid[y][x+1] << ">"
            end
          when "v"
            if grid[y+1][x] == ["#"]
              new_grid[1] ||= []
              new_grid[1][x] ||= []
              new_grid[1][x] << "v"
            else
              new_grid[y+1] ||= []
              new_grid[y+1][x] ||= []
              new_grid[y+1][x] << "v"
            end
          when "<"
            if grid[y][x-1] == ["#"]
              new_grid[y] ||= []
              new_grid[y][grid[y].size - 2] ||= []
              new_grid[y][grid[y].size - 2] << "<"
            else
              new_grid[y] ||= []
              new_grid[y][x-1] ||= []
              new_grid[y][x-1] << "<"
            end
          end
        end
      end
    end

    grid.size.times do |y|
      new_grid[y] ||= []
      grid[y].size.times do |x|
        new_grid[y][x] ||= ["."]
      end
    end

    new_grid
  end
end

def shortest_path(grids, source, sink)
  visited = Set.new
  visited << source

  distances = grids.map { |grid| grid.map { |row| row.map { Float::INFINITY } } }
  paths = grids.map { |grid| grid.map { |row| row.map { nil } } }
  distances[source[2]][source[1]][source[0]] = 0

  queue = [source]

  until queue.empty?
    x, y, z = queue.shift

    if distances[z + 1].nil?
      grids << move_blizzard(grids.last)
      distances << grids.last.map { |row| row.map { |cell| Float::INFINITY } }
      paths << grids.last.map { |grid| grid.map { |row| row.map { nil } } }
    end

    [
      [x,     y,     z + 1], # wait
      [x - 1, y,     z + 1], # move left
      [x + 1, y,     z + 1], # move right
      [x,     y - 1, z + 1], # move up
      [x,     y + 1, z + 1], # move down
    ].each do |nx, ny, nz|
      next if nx < 0 || ny < 0
      next if nz >= grids.size || ny >= grids[0].size || nx >= grids[0][0].size
      next unless grids[nz][ny][nx] == ["."]

      if distances[nz][ny][nx] >= distances[z][y][x] + 1
        distances[nz][ny][nx] = distances[z][y][x] + 1
        paths[nz][ny][nx] = [x, y, z]
      end

      unless visited.include?([nx, ny, nz])
        queue << [nx, ny, nz]
        queue.sort_by! { |x, y, z| distances[z][y][x] }
        visited << [nx, ny, nz]
      end
    end

    return [distances, grids, paths] if [x, y] == [sink[0], sink[1]]
  end

  throw "BAD ELVES!"
end

# grids = [parse(example)]
grids = [parse(input)]
start_pos = [grids[0][0].index(["."]), 0, 0]
end_pos = [grids[0][grids[0].size - 1].index(["."]), grids[0].size - 1, 0]

t = Time.now
first_distance, grids, first_paths = shortest_path(grids, start_pos, end_pos)
first_trip = first_distance.last[end_pos[1]][end_pos[0]]

puts "PART 1"
puts first_trip - 1
puts "Took #{Time.now - t} seconds"
end_pos[2] = grids.size - 1
visualize(grids, first_paths, start_pos, end_pos)
exit

t = Time.now
start_pos[2] = grids.size - 1

second_distance, grids, second_paths = shortest_path(grids, end_pos, start_pos)

start_pos[2] = grids.size - 1
end_pos[2] = grids.size - 1
third_distance, grids, third_paths = shortest_path(grids, start_pos, end_pos)

second_trip = second_distance.last[start_pos[1]][start_pos[0]]
third_trip = third_distance.last[end_pos[1]][end_pos[0]]

puts
puts "PART 2"
puts first_trip + second_trip + third_trip - 1
puts "Took #{Time.now - t} seconds"
