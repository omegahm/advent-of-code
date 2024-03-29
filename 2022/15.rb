input = <<~INPUT
Sensor at x=9, y=16: closest beacon is at x=10, y=16
Sensor at x=2, y=18: closest beacon is at x=-2, y=15
Sensor at x=13, y=2: closest beacon is at x=15, y=3
Sensor at x=12, y=14: closest beacon is at x=10, y=16
Sensor at x=10, y=20: closest beacon is at x=10, y=16
Sensor at x=14, y=17: closest beacon is at x=10, y=16
Sensor at x=8, y=7: closest beacon is at x=2, y=10
Sensor at x=2, y=0: closest beacon is at x=2, y=10
Sensor at x=0, y=11: closest beacon is at x=2, y=10
Sensor at x=20, y=14: closest beacon is at x=25, y=17
Sensor at x=17, y=20: closest beacon is at x=21, y=22
Sensor at x=16, y=7: closest beacon is at x=15, y=3
Sensor at x=14, y=3: closest beacon is at x=15, y=3
Sensor at x=20, y=1: closest beacon is at x=15, y=3
INPUT

input = <<~INPUT
Sensor at x=3999724, y=2000469: closest beacon is at x=4281123, y=2282046
Sensor at x=3995530, y=8733: closest beacon is at x=3321979, y=-692911
Sensor at x=3016889, y=2550239: closest beacon is at x=2408038, y=2645605
Sensor at x=3443945, y=3604888: closest beacon is at x=3610223, y=3768674
Sensor at x=168575, y=491461: closest beacon is at x=1053731, y=-142061
Sensor at x=2820722, y=3865596: closest beacon is at x=3191440, y=3801895
Sensor at x=2329102, y=2456329: closest beacon is at x=2408038, y=2645605
Sensor at x=3889469, y=3781572: closest beacon is at x=3610223, y=3768674
Sensor at x=3256726, y=3882107: closest beacon is at x=3191440, y=3801895
Sensor at x=3729564, y=3214899: closest beacon is at x=3610223, y=3768674
Sensor at x=206718, y=2732608: closest beacon is at x=-152842, y=3117903
Sensor at x=2178192, y=2132103: closest beacon is at x=2175035, y=2000000
Sensor at x=1884402, y=214904: closest beacon is at x=1053731, y=-142061
Sensor at x=3060435, y=980430: closest beacon is at x=2175035, y=2000000
Sensor at x=3998355, y=3965954: closest beacon is at x=3610223, y=3768674
Sensor at x=3704399, y=3973731: closest beacon is at x=3610223, y=3768674
Sensor at x=1421672, y=3446889: closest beacon is at x=2408038, y=2645605
Sensor at x=3415633, y=3916020: closest beacon is at x=3191440, y=3801895
Sensor at x=2408019, y=2263990: closest beacon is at x=2408038, y=2645605
Sensor at x=3735247, y=2533767: closest beacon is at x=4281123, y=2282046
Sensor at x=1756494, y=1928662: closest beacon is at x=2175035, y=2000000
Sensor at x=780161, y=1907142: closest beacon is at x=2175035, y=2000000
Sensor at x=3036853, y=3294727: closest beacon is at x=3191440, y=3801895
Sensor at x=53246, y=3908582: closest beacon is at x=-152842, y=3117903
Sensor at x=2110517, y=2243287: closest beacon is at x=2175035, y=2000000
Sensor at x=3149491, y=3998374: closest beacon is at x=3191440, y=3801895
INPUT

signals = []

input.lines.each do |line|
  sx, sy, bx, by = line.scan(/-?\d+/).map(&:to_i)
  signals << [sx, sy, bx, by]
end

def distance(x1, y1, x2, y2)
  (x2 - x1).abs + (y2 - y1).abs
end

# PART 1
t = Time.now

# ROW_VALUE = 10
ROW_VALUE = 2_000_000
num_no_beacons = 0
minx = signals.map { |sx, sy, bx, by| sx - distance(sx, sy, bx, by) }.min
maxx = signals.map { |sx, sy, bx, by| sx + distance(sx, sy, bx, by) }.max

minx.upto(maxx) do |x|
  r = signals.any? do |sx, sy, bx, by|
    !(bx == x && by == ROW_VALUE) &&
      (distance(sx, sy, x, ROW_VALUE) <= distance(sx, sy, bx, by))
  end
  num_no_beacons += r ? 1 : 0
end

puts "PART 1"
puts num_no_beacons
puts "Took #{Time.now - t} seconds"

# PART 2
t = Time.now

# MAX = 20
MAX = 4_000_000

0.upto(MAX) do |y|
  x = 0

  while x <= MAX
    # Find an x, y that are not in range of any beacon
    found = signals.all? do |sx, sy, bx, by|
      dist_to_beacon = distance(sx, sy, bx, by)
      dist_to_point = distance(sx, sy, x, y)

      if dist_to_point > dist_to_beacon
        true
      else
        # Skip to last x in range by going to the middle of the sensor and
        # adding the distance to the beacon minus the distance on the y-axis
        y_dist = (sy - y).abs
        x = sx + (dist_to_beacon - y_dist)

        false
      end
    end

    if found
      puts "PART 2"
      puts x * 4_000_000 + y
      puts "Took #{Time.now - t} seconds"
      exit
    end

    x += 1
  end
end
