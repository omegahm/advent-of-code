require_relative "../advent_of_code"

input = <<~INPUT.strip
7,1
11,1
11,7
9,7
9,5
2,5
2,3
7,3
INPUT

points = []
@input.split("\n").each do |line|
  x, y = line.split(",").map(&:to_i)
  points << [x, y]
end

largest_area = 0
points.combination(2) do |(x1, y1), (x2, y2)|
  area = ((x2 - x1).abs + 1) * ((y2 - y1).abs + 1)
  largest_area = area if area > largest_area
end

print_part1 largest_area

def intersects((x1, y1), (x2, y2), (x3, y3), (x4, y4))
  # https://en.wikipedia.org/wiki/Line%E2%80%93line_intersection#Given_two_points_on_each_line_segment
  denom = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)
  return false if denom == 0

  t = (y4 - y3) * (x4 - x1) + (x3 - x4) * (y4 - y1)
  u = (y1 - y2) * (x4 - x1) + (x2 - x1) * (y4 - y1)

  (0 < t && t < denom) && (0 < u && u < denom)
end

def point_in_polygon?(point, polygon)
  # https://en.wikipedia.org/wiki/Even%E2%80%93odd_rule
  x, y = point
  inside = false

  polygon.each_cons(2) do |(x1, y1), (x2, y2)|
    return true if x == x1 && y == y1

    if (y1 > y) != (y2 > y)
      slope = (x - x1) * (y2 - y1) - (x2 - x1) * (y - y1)
      return true if slope == 0

      inside = !inside if (slope < 0) != (y2 < y1)
    end
  end

  inside
end

polygon_edges = points.each_cons(2).map { |p1, p2| [p1, p2] }
polygon_edges << [points.last, points.first]

largest_area = 0
points.combination(2) do |(x1, y1), (x2, y2)|
  # Check if all corners are inside the polygon
  corners = [[x1, y1], [x1, y2], [x2, y1], [x2, y2]]
  next unless corners.all? { |corner| point_in_polygon?(corner, points) }

  # Construct rectangle diagonals
  rect_diagonals = [
    [[x1, y1], [x2, y2]],
    [[x1, y2], [x2, y1]],
  ]

  # Check if any diagonal intersects with polygon edges
  intersects_polygon = rect_diagonals.any? do |diag_start, diag_end|
    polygon_edges.any? do |edge_start, edge_end|
      intersects(diag_start, diag_end, edge_start, edge_end)
    end
  end

  next if intersects_polygon

  # The rectangle lives inside the polygon. Is it the largest?
  area = ((x2 - x1).abs + 1) * ((y2 - y1).abs + 1)
  largest_area = [area, largest_area].max
end

print_part2 largest_area
