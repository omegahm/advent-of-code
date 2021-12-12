input = File.read('day3.input')

# TEST INPUT
# input = <<~HERE
#   ..##.......
#   #...#...#..
#   .#....#..#.
#   ..#.#...#.#
#   .#...##..#.
#   ..#.##.....
#   .#.#.#....#
#   .#........#
#   #.##...#...
#   #...##....#
#   .#..#...#.#
# HERE

result = [0, 0, 0, 0, 0]
xs = [0, 0, 0, 0, 0]
slope = [1, 3, 5, 7, 1]

input.split("\n").each_with_index do |row, idx|
  xs = xs.map.with_index do |x, i|
    if i == 4 && idx % 2 == 1
      x
    else
      result[i] += 1 if row[x] == "#"
      (x + slope[i]) % row.size
    end
  end
end

puts result.reduce(:*)
