require_relative "../advent_of_code"

input = <<~INPUT.strip
162,817,812
57,618,57
906,360,560
592,479,940
352,342,300
466,668,158
542,29,236
431,825,988
739,650,466
52,470,668
216,146,977
819,987,18
117,168,530
805,96,715
346,949,466
970,615,88
941,993,340
862,61,35
984,92,344
425,690,689
INPUT

# CONNECTIONS = 10
CONNECTIONS = 1000

points = @input.lines.map { _1.strip.split(",").map(&:to_i) }

distances = {}
points.combination(2) do |(x1, y1, z1), (x2, y2, z2)|
  dist = Math.sqrt((x2 - x1)**2 + (y2 - y1)**2 + (z2 - z1)**2)
  distances[[[x1, y1, z1], [x2, y2, z2]]] = dist
end

circuits = []
connections = 0
distances.sort_by { _2 }.each do |(point1, point2), dist|
  idx1 = circuits.index { |circuit| circuit.include?(point1) }
  idx2 = circuits.index { |circuit| circuit.include?(point2) }

  if idx1.nil? && idx2.nil?
    circuits << [point1, point2]
  elsif !idx1.nil? && idx2.nil?
    circuits[idx1] << point2
  elsif idx1.nil? && !idx2.nil?
    circuits[idx2] << point1
  elsif idx1 == idx2
    # no-op
  else
    circuits[idx1].concat(circuits[idx2])
    circuits.delete_at(idx2)
  end

  if circuits[0].size == points.size
    result = point1[0] * point2[0]
    print_part2 result
    break
  end

  connections += 1

  if connections == CONNECTIONS
    result = circuits.map(&:size).sort.reverse.take(3).reduce(:*)
    print_part1 result
  end
end
