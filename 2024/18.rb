require_relative "../advent_of_code"

input = <<~INPUT.strip
5,4
4,2
4,5
3,0
2,1
6,3
2,4
1,5
0,6
3,3
2,6
5,1
1,2
5,5
2,5
6,5
1,4
0,4
6,4
1,1
6,1
1,0
0,5
1,6
2,0
INPUT

require "rb_heap"

# width, height, data_size = [7, 7, 12]
width, height, data_size = [71, 71, 1024]

input = @input.split("\n")

def shortest_path(input, bytes, height, width, part: 1)
  map = height.times.map { |y| Array.new(width, ".") }

  input.take(bytes).each do |line|
    x, y = line.split(",").map(&:to_i)
    map[y][x] = "#"
  end

  graph = {}
  dist = {}
  queue = Heap.new { |a, b| a[0] < b[0] }

  map.each_with_index do |row, y|
    row.each_with_index do |elem, x|
      if elem == "."
        graph[[x, y]] = []
        graph[[x, y]] << [x-1, y] if x > 0 && row[x-1] == "."
        graph[[x, y]] << [x+1, y] if x < row.size - 1 && row[x+1] == "."
        graph[[x, y]] << [x, y-1] if y > 0 && map[y-1][x] == "."
        graph[[x, y]] << [x, y+1] if y < map.size - 1 && map[y+1][x] == "."
      end
    end
  end

  dist[[0, 0]] = 0
  queue << [0, 0, 0]

  paths = {} if ENV["IMAGE"] && part == 1

  until queue.empty?
    cost, *node = queue.pop

    graph[node].each do |neighbour|
      alt = cost + 1

      if alt < dist.fetch(neighbour, Float::INFINITY)
        dist[neighbour] = alt
        paths[neighbour] = node if ENV["IMAGE"] && part == 1
        queue << [alt, *neighbour]
      end
    end
  end

  return paths if ENV["IMAGE"] && part == 1
  return dist if part == 1
  dist[[width - 1, height - 1]].nil?
end

dist = shortest_path(input, data_size, height, width)

print_part1 dist[[width - 1, height - 1]]

index = (data_size+1..input.size).bsearch do |byte|
  shortest_path(input, byte, height, width, part: 2)
end

print_part2 input[index-1]

if ENV["IMAGE"]
  require "rmagick"

  paths = shortest_path(input, index-1, height, width)

  path = []
  current = [width - 1, height - 1]
  until current.nil?
    path << current
    current = paths[current]
  end

  map = height.times.map { |y| Array.new(width, ".") }

  input.take(index-1).each do |line|
    x, y = line.split(",").map(&:to_i)
    map[y][x] = "#"
  end

  # Adding 2 to add a black border
  data = Array.new(width+2) do |x|
    Array.new(height+2) do |y|
      if x == 0 || y == 0 || x == width+1 || y == height+1
        "black"
      elsif map[y-1][x-1] == "#"
        "black"
      elsif map[y-1][x-1] == "."
        "white"
      end
    end
  end

  img_list = Magick::ImageList.new
  img = Magick::Image.new(width + 2, height + 2)

  data.each_with_index do |row, y|
    row.each_with_index do |color, x|
      img.pixel_color(y, x, color)
    end
  end
  img_list << img.dup

  path.reverse.each_with_index do |(x, y), idx|
    print "\33[2K\rGenerating animation: #{((idx+1).fdiv(path.size) * 100).round(1)}% done (#{idx+1} frames)..."
    img.pixel_color(x+1, y+1, "red")
    img_list << img.dup
  end

  image_name = "18.gif"

  puts "\nWriting #{image_name}..."
  img_list.write(image_name)

  puts "Optimizing #{image_name}..."
  `gifsicle --scale=8 --optimize=3 --lossy=200 --delay=1 --loopcount=0 --threads=4 --output=#{image_name} #{image_name}`
end
