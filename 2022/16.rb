input = <<~INPUT
Valve AA has flow rate=0; tunnels lead to valves DD, II, BB
Valve BB has flow rate=13; tunnels lead to valves CC, AA
Valve CC has flow rate=2; tunnels lead to valves DD, BB
Valve DD has flow rate=20; tunnels lead to valves CC, AA, EE
Valve EE has flow rate=3; tunnels lead to valves FF, DD
Valve FF has flow rate=0; tunnels lead to valves EE, GG
Valve GG has flow rate=0; tunnels lead to valves FF, HH
Valve HH has flow rate=22; tunnel leads to valve GG
Valve II has flow rate=0; tunnels lead to valves AA, JJ
Valve JJ has flow rate=21; tunnel leads to valve II
INPUT

input = <<~INPUT
Valve EV has flow rate=0; tunnels lead to valves WG, IB
Valve IB has flow rate=0; tunnels lead to valves EW, EV
Valve KL has flow rate=0; tunnels lead to valves JH, OY
Valve QJ has flow rate=0; tunnels lead to valves TX, JH
Valve OA has flow rate=12; tunnels lead to valves SB, GI, ED
Valve BQ has flow rate=0; tunnels lead to valves NK, JJ
Valve PZ has flow rate=0; tunnels lead to valves JH, VA
Valve QO has flow rate=8; tunnels lead to valves LN, LU, CU, SQ, YZ
Valve MP has flow rate=0; tunnels lead to valves LN, GO
Valve YZ has flow rate=0; tunnels lead to valves AA, QO
Valve CU has flow rate=0; tunnels lead to valves RY, QO
Valve UE has flow rate=16; tunnel leads to valve VP
Valve HT has flow rate=0; tunnels lead to valves AA, JE
Valve EF has flow rate=0; tunnels lead to valves ES, JE
Valve JJ has flow rate=15; tunnel leads to valve BQ
Valve JX has flow rate=0; tunnels lead to valves AA, GO
Valve AA has flow rate=0; tunnels lead to valves JX, TX, HT, YZ
Valve MI has flow rate=21; tunnels lead to valves PQ, QT
Valve ES has flow rate=0; tunnels lead to valves EF, NK
Valve VC has flow rate=0; tunnels lead to valves MC, IW
Valve LN has flow rate=0; tunnels lead to valves MP, QO
Valve ED has flow rate=0; tunnels lead to valves OA, RY
Valve WG has flow rate=20; tunnels lead to valves EV, OY, KF
Valve GI has flow rate=0; tunnels lead to valves WE, OA
Valve UK has flow rate=0; tunnels lead to valves TO, JE
Valve GY has flow rate=23; tunnels lead to valves EO, QT
Valve TX has flow rate=0; tunnels lead to valves AA, QJ
Valve OE has flow rate=0; tunnels lead to valves GO, NK
Valve OQ has flow rate=9; tunnels lead to valves VP, SB
Valve NK has flow rate=25; tunnels lead to valves OE, ES, BQ
Valve LU has flow rate=0; tunnels lead to valves JH, QO
Valve RY has flow rate=18; tunnels lead to valves ED, IW, CU
Valve KF has flow rate=0; tunnels lead to valves JE, WG
Valve IW has flow rate=0; tunnels lead to valves VC, RY
Valve SQ has flow rate=0; tunnels lead to valves MC, QO
Valve PQ has flow rate=0; tunnels lead to valves MC, MI
Valve TO has flow rate=0; tunnels lead to valves UK, JH
Valve OY has flow rate=0; tunnels lead to valves KL, WG
Valve JE has flow rate=10; tunnels lead to valves EF, ND, HT, KF, UK
Valve JH has flow rate=3; tunnels lead to valves QJ, KL, PZ, TO, LU
Valve VP has flow rate=0; tunnels lead to valves OQ, UE
Valve EW has flow rate=22; tunnel leads to valve IB
Valve ND has flow rate=0; tunnels lead to valves JE, GO
Valve VA has flow rate=0; tunnels lead to valves GO, PZ
Valve QT has flow rate=0; tunnels lead to valves MI, GY
Valve EO has flow rate=0; tunnels lead to valves GY, MC
Valve MC has flow rate=11; tunnels lead to valves PQ, SQ, WE, EO, VC
Valve GO has flow rate=4; tunnels lead to valves JX, VA, OE, MP, ND
Valve SB has flow rate=0; tunnels lead to valves OQ, OA
Valve WE has flow rate=0; tunnels lead to valves MC, GI
INPUT

$graph = {}
$distances = {}

input.lines.map(&:chomp).sort.each do |line|
  name, rate, tunnels = line.scan(/Valve (\w+) has flow rate=(\d+); tunnels? leads? to valves? (.*)/).first

  $graph[name] = rate.to_i

  tunnels.split(', ').each do |tunnel|
    $distances[name] ||= {}
    $distances[name][tunnel] = 1
  end
end

$graph.keys.each do |name|
  $graph.keys.each do |name2|
    $distances[name][name2] ||= Float::INFINITY
  end
end

$graph.keys.each do |k|
  $graph.keys.each do |j|
    $graph.keys.each do |i|
      $distances[i][j] = [$distances[i][j], $distances[i][k] + $distances[k][j]].min
    end
  end
end

def solve(current, rest, time, method)
  return 0 if time == 0

  rest.select { |node| $distances[current][node] < time }.map do |node|
    new_time = time - $distances[current][node] - 1
    result = send(method, node, rest - [node], new_time)

    $graph[node] * new_time + result
  end.max || 0
end

$memo = {}
def solve_with_person(current, rest, time)
  $memo[[current, rest, time]] ||= solve(current, rest, time, :solve_with_person)
end

def solve_with_elephant(current, rest, time)
  [
    solve(current, rest, time, :solve_with_elephant),
    solve_with_person("AA", rest, 26)
  ].max
end

puts "PART 1"
t = Time.now
valves = $graph.select { |_key, rate| rate > 0 }.keys
puts solve_with_person("AA", valves, 30)
puts "Took #{Time.now - t} seconds"

puts "PART 2"
t = Time.now
puts solve_with_elephant("AA", valves, 26)
puts "Took #{Time.now - t} seconds"
