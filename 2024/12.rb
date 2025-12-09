require_relative "../advent_of_code"

input = <<~INPUT.strip
RRRRIICCFF
RRRRIICCCF
VVRRRCCFFF
VVRCCCJFFF
VVVVCJJCFE
VVIVCCJJEE
VVIIICJJEE
MIIIIIJJEE
MIIISIJEEE
MMMISSJEEE
INPUT

seen = {}
regions = []

map = @input.split("\n").map(&:chars)

(0..map[0].size-1).each do |x|
  (0..map.size-1).each do |y|
    next if seen[[x, y]]

    region = []
    current_region = map[y][x]
    region << [x, y]
    seen[[x, y]] = true

    queue = []
    queue << [x-1, y] unless x == 0
    queue << [x+1, y] unless x == map[0].size - 1
    queue << [x, y-1] unless y == 0
    queue << [x, y+1] unless y == map.size - 1

    until queue.empty?
      nx, ny = queue.pop
      next if seen[[nx, ny]]
      next unless map[ny][nx] == current_region
      seen[[nx, ny]] = true
      region << [nx, ny]

      queue << [nx-1, ny] unless nx == 0
      queue << [nx+1, ny] unless nx == map[0].size - 1
      queue << [nx, ny-1] unless ny == 0
      queue << [nx, ny+1] unless ny == map.size - 1
    end

    regions << region
  end
end

def perimeter(region)
  region.sum do |(x, y)|
    4 - [[x-1, y], [x+1, y], [x, y-1], [x, y+1]].count { region.include?(_1) }
  end
end

def sides(region)
  minx, miny, maxx, maxy = [Float::INFINITY, Float::INFINITY, -Float::INFINITY, -Float::INFINITY]

  region.each do |x, y|
    minx = [minx, x].min
    miny = [miny, y].min
    maxx = [maxx, x].max
    maxy = [maxy, y].max
  end

  map = []

  (0..maxx-minx).each do |x|
    (0..maxy-miny).each do |y|
      map[y] ||= []
      map[y][x] = "."
    end
  end

  region.each do |x, y|
    map[y-miny] ||= []
    map[y-miny][x-minx] = "X"
  end

  edge_count = [map, map.reverse, map.transpose, map.transpose.reverse].sum do |inner_map|
    edges = [[]]

    inner_map.each_with_index do |row, y|
      row.each_with_index do |elem, x|
        if elem == "X" && (y == 0 || inner_map[y-1][x] != "X")
          edges[-1] << [x, y]
        else
          edges << []
        end
      end
      edges << []
    end

    edges.reject(&:empty?).count { |edge| edge.any? { |(x, y)| y == 0 || inner_map[y-1][x] == "." } }
  end

  edge_count
end

def area(region)
  region.size
end

print_part1 regions.sum { perimeter(_1) * area(_1) }
print_part2 regions.sum { sides(_1) * area(_1) }

if ENV["VISUALIZE"]
  output = []
  regions.each do |region|
    color_fg = "#{(rand * 255).to_i};#{(rand * 255).to_i};#{(rand * 255).to_i}"
    color_bg = "#{(rand * 255).to_i};#{(rand * 255).to_i};#{(rand * 255).to_i}"

    region.each do |(x, y)|
      output[y] ||= []
      output[y][x] = ""
      output[y][x] << "\e[38;2;#{color_fg}m"
      output[y][x] << "\e[48;2;#{color_bg}m"
      output[y][x] << map[y][x]
      output[y][x] << "\e[0m"
    end
  end
  puts output.map(&:join).join("\n")
end

if ENV["IMAGE"]
  require "rmagick"

  SCALE = 16

  img = Magick::Image.new(SCALE * map[0].size, SCALE * map.size)

  regions.each do |region|
    color = Magick::Pixel.from_hsla(
      (360 * rand).to_i, # hue
      128, # saturation
      128 # lightness
    )

    region.each do |(x, y)|
      SCALE.times do |i|
        SCALE.times do |j|
          img.pixel_color(SCALE * x + i, SCALE * y + j, color)
        end
      end
    end
  end

  image_name = "12.png"
  img.write(image_name)
end
