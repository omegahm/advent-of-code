input = File.readlines("day24.input").map(&:chomp)

directions = input.map do |line|
  line.scan(/e|se|sw|w|nw|ne/)
end

hexagons = {}

directions.each do |direction|
  x, y, z = [0, 0, 0]

  direction.each do |step|
    case step
    when "e"
      x += 1
      y -= 1
    when "se"
      y -= 1
      z += 1
    when "sw"
      x -= 1
      z += 1
    when "w"
      x -= 1
      y += 1
    when "nw"
      y += 1
      z -= 1
    when "ne"
      x += 1
      z -= 1
    end
  end

  hexagons[[x, y, z]] ||= "white"
  hexagons[[x, y, z]] = hexagons[[x, y, z]] == "white" ? "black" : "white"
end

puts hexagons.values.count("black")

# PART 2
new_hexagons = {}

neighbour_delta = [
  [ 1,  0, -1],
  [ 1, -1,  0],
  [ 0, -1,  1],
  [-1,  0,  1],
  [-1,  1,  0],
  [ 0,  1, -1]
]

100.times do |day|
  extra = []
  hexagons.each do |(x, y, z), color|
    neighbours = { "white" => 0, "black" => 0 }
    neighbour_delta.each do |(nx, ny, nz)|
      new_color = hexagons[[x+nx, y+ny, z+nz]]
      if new_color.nil?
        extra << [x+nx, y+ny, z+nz]
      else
        neighbours[new_color] += 1
      end
    end

    if color == "black" && (neighbours["black"] == 0 || neighbours["black"] > 2)
      new_hexagons[[x, y, z]] = "white"
    elsif color == "white" && neighbours["black"] == 2
      new_hexagons[[x, y, z]] = "black"
    else
      new_hexagons[[x, y, z]] = color
    end
  end

  extra.each do |(x, y, z)|
    if neighbour_delta.select { |(nx, ny, nz)| hexagons[[x+nx, y+ny, z+nz]] == "black" }.count == 2
      new_hexagons[[x, y, z]] = "black"
    end
  end

  hexagons = new_hexagons
  new_hexagons = {}
end

puts hexagons.values.count("black")
