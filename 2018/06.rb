input = <<~INPUT.strip
1, 1
1, 6
8, 3
3, 4
5, 5
8, 9
INPUT

input = <<~INPUT.strip
260, 78
42, 40
87, 276
219, 124
166, 137
341, 138
82, 121
114, 174
218, 289
61, 358
328, 164
279, 50
218, 107
273, 320
192, 349
354, 103
214, 175
128, 196
237, 67
333, 150
98, 260
166, 217
92, 212
55, 165
205, 138
321, 199
285, 148
217, 130
357, 319
160, 67
63, 75
345, 123
316, 220
41, 253
240, 245
201, 124
336, 166
95, 301
55, 181
219, 315
209, 237
317, 254
314, 300
242, 295
295, 293
285, 263
330, 204
112, 106
348, 49
81, 185
INPUT

ALPHA = ('A'..'Z').to_a + ('a'..'z').to_a + ('0'..'9').to_a
grid = {}
input.split("\n").each_with_index do |line, i|
  grid[line.split(', ').map(&:to_i)] = ALPHA[i]
end

minx, maxx = grid.keys.map(&:first).minmax
miny, maxy = grid.keys.map(&:last).minmax

map = []
miny.upto(maxy) do |y|
  map << []
  minx.upto(maxx) do |x|
    map[-1] << (grid[[x, y]] ? grid[[x, y]].to_s : ".")
  end
end

100.times do
  map.unshift(["."] * map.first.size)
  map << (["."] * map.first.size)
  map.map! { |row| row.unshift(".") && row << "." }
end

def manhatten(x1, y1, x2, y2)
  (x1 - x2).abs + (y1 - y2).abs
end

new_map = map.map(&:dup)
map.each_with_index do |row, y|
  row.each_with_index do |cell, x|
    if cell == "."
      mh = grid.keys.map { |gx, gy| [gx, gy, manhatten(x, y, gx, gy)] }
      mhmin = mh.map(&:last).min
      if mh.count { |_, _, i| i == mhmin } > 1
        new_map[y][x] = cell
      else
        gx, gy, _ = mh.find { |_, _, i| i == mhmin }
        new_map[y][x] = grid[[gx, gy]]
      end
    end
  end
end

edges = (new_map.first + new_map.last + new_map.map(&:first) + new_map.map(&:last) - ["."]).uniq
r = new_map.flatten.reject { |c| edges.include?(c) || c == "." }.tally

puts "Part 1: #{r.values.max}"

### PART 2

count = 0
minx.upto(maxx) do |x|
  miny.upto(maxy) do |y|
    sum = 0
    grid.keys.each do |gx, gy|
      sum += manhatten(x, y, gx, gy)
    end
    count += 1 if sum < 10_000
  end
end

puts "Part 2: #{count}"
