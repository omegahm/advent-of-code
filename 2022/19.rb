input = <<~INPUT
Blueprint 1: Each ore robot costs 4 ore. Each clay robot costs 2 ore. Each obsidian robot costs 3 ore and 14 clay. Each geode robot costs 2 ore and 7 obsidian.
Blueprint 2: Each ore robot costs 2 ore. Each clay robot costs 3 ore. Each obsidian robot costs 3 ore and 8 clay. Each geode robot costs 3 ore and 12 obsidian.
INPUT

input = <<~INPUT
Blueprint 1: Each ore robot costs 4 ore. Each clay robot costs 4 ore. Each obsidian robot costs 3 ore and 9 clay. Each geode robot costs 3 ore and 7 obsidian.
Blueprint 2: Each ore robot costs 4 ore. Each clay robot costs 4 ore. Each obsidian robot costs 2 ore and 16 clay. Each geode robot costs 4 ore and 16 obsidian.
Blueprint 3: Each ore robot costs 4 ore. Each clay robot costs 4 ore. Each obsidian robot costs 2 ore and 14 clay. Each geode robot costs 4 ore and 15 obsidian.
Blueprint 4: Each ore robot costs 2 ore. Each clay robot costs 2 ore. Each obsidian robot costs 2 ore and 20 clay. Each geode robot costs 2 ore and 14 obsidian.
Blueprint 5: Each ore robot costs 3 ore. Each clay robot costs 4 ore. Each obsidian robot costs 4 ore and 5 clay. Each geode robot costs 4 ore and 8 obsidian.
Blueprint 6: Each ore robot costs 4 ore. Each clay robot costs 4 ore. Each obsidian robot costs 4 ore and 18 clay. Each geode robot costs 4 ore and 9 obsidian.
Blueprint 7: Each ore robot costs 3 ore. Each clay robot costs 4 ore. Each obsidian robot costs 4 ore and 17 clay. Each geode robot costs 4 ore and 16 obsidian.
Blueprint 8: Each ore robot costs 3 ore. Each clay robot costs 3 ore. Each obsidian robot costs 3 ore and 6 clay. Each geode robot costs 2 ore and 16 obsidian.
Blueprint 9: Each ore robot costs 3 ore. Each clay robot costs 4 ore. Each obsidian robot costs 2 ore and 19 clay. Each geode robot costs 2 ore and 12 obsidian.
Blueprint 10: Each ore robot costs 2 ore. Each clay robot costs 4 ore. Each obsidian robot costs 3 ore and 20 clay. Each geode robot costs 2 ore and 17 obsidian.
Blueprint 11: Each ore robot costs 2 ore. Each clay robot costs 3 ore. Each obsidian robot costs 2 ore and 17 clay. Each geode robot costs 3 ore and 19 obsidian.
Blueprint 12: Each ore robot costs 2 ore. Each clay robot costs 4 ore. Each obsidian robot costs 4 ore and 11 clay. Each geode robot costs 3 ore and 8 obsidian.
Blueprint 13: Each ore robot costs 2 ore. Each clay robot costs 4 ore. Each obsidian robot costs 4 ore and 20 clay. Each geode robot costs 4 ore and 18 obsidian.
Blueprint 14: Each ore robot costs 3 ore. Each clay robot costs 4 ore. Each obsidian robot costs 3 ore and 12 clay. Each geode robot costs 3 ore and 17 obsidian.
Blueprint 15: Each ore robot costs 2 ore. Each clay robot costs 4 ore. Each obsidian robot costs 4 ore and 19 clay. Each geode robot costs 2 ore and 18 obsidian.
Blueprint 16: Each ore robot costs 3 ore. Each clay robot costs 3 ore. Each obsidian robot costs 2 ore and 19 clay. Each geode robot costs 2 ore and 12 obsidian.
Blueprint 17: Each ore robot costs 4 ore. Each clay robot costs 3 ore. Each obsidian robot costs 4 ore and 18 clay. Each geode robot costs 4 ore and 11 obsidian.
Blueprint 18: Each ore robot costs 2 ore. Each clay robot costs 2 ore. Each obsidian robot costs 2 ore and 15 clay. Each geode robot costs 2 ore and 7 obsidian.
Blueprint 19: Each ore robot costs 4 ore. Each clay robot costs 4 ore. Each obsidian robot costs 3 ore and 5 clay. Each geode robot costs 3 ore and 18 obsidian.
Blueprint 20: Each ore robot costs 4 ore. Each clay robot costs 3 ore. Each obsidian robot costs 3 ore and 10 clay. Each geode robot costs 3 ore and 10 obsidian.
Blueprint 21: Each ore robot costs 4 ore. Each clay robot costs 3 ore. Each obsidian robot costs 3 ore and 7 clay. Each geode robot costs 3 ore and 9 obsidian.
Blueprint 22: Each ore robot costs 2 ore. Each clay robot costs 3 ore. Each obsidian robot costs 3 ore and 9 clay. Each geode robot costs 3 ore and 9 obsidian.
Blueprint 23: Each ore robot costs 3 ore. Each clay robot costs 4 ore. Each obsidian robot costs 3 ore and 10 clay. Each geode robot costs 2 ore and 7 obsidian.
Blueprint 24: Each ore robot costs 3 ore. Each clay robot costs 4 ore. Each obsidian robot costs 4 ore and 18 clay. Each geode robot costs 3 ore and 8 obsidian.
Blueprint 25: Each ore robot costs 2 ore. Each clay robot costs 3 ore. Each obsidian robot costs 3 ore and 8 clay. Each geode robot costs 3 ore and 20 obsidian.
Blueprint 26: Each ore robot costs 4 ore. Each clay robot costs 3 ore. Each obsidian robot costs 4 ore and 20 clay. Each geode robot costs 2 ore and 15 obsidian.
Blueprint 27: Each ore robot costs 3 ore. Each clay robot costs 4 ore. Each obsidian robot costs 4 ore and 18 clay. Each geode robot costs 2 ore and 11 obsidian.
Blueprint 28: Each ore robot costs 3 ore. Each clay robot costs 4 ore. Each obsidian robot costs 2 ore and 20 clay. Each geode robot costs 4 ore and 7 obsidian.
Blueprint 29: Each ore robot costs 3 ore. Each clay robot costs 3 ore. Each obsidian robot costs 3 ore and 11 clay. Each geode robot costs 2 ore and 8 obsidian.
Blueprint 30: Each ore robot costs 4 ore. Each clay robot costs 3 ore. Each obsidian robot costs 4 ore and 15 clay. Each geode robot costs 3 ore and 12 obsidian.
INPUT

ORE = 0
CLAY = 1
OBSIDIAN = 2
GEODE = 3

$max_ore_cost = 0
blueprints = input.split("\n").map do |line|
  _id, ore_ore_cost, clay_ore_cost, obsidian_ore_cost, obsidian_clay_cost, geode_ore_cost, geode_obsidian_cost = line.scan(/(\d+)/).flatten.map(&:to_i)

  $max_ore_cost = [$max_ore_cost, ore_ore_cost, clay_ore_cost, obsidian_ore_cost, geode_ore_cost].max

  [
    [ore_ore_cost, 0, 0, 0],
    [clay_ore_cost, 0, 0, 0],
    [obsidian_ore_cost, obsidian_clay_cost, 0, 0],
    [geode_ore_cost, 0, geode_obsidian_cost, 0],
  ]
end

$memo = {}
def backtrack(costs, time, ore_robots = 1, clay_robots = 0, obsidian_robots = 0, geode_robots = 0, ore = 0, clay = 0, obsidian = 0, geode = 0)
  $memo[[costs, time, ore_robots, clay_robots, obsidian_robots, geode_robots, ore, clay, obsidian, geode]] ||= begin
    # We cannot benefit from building on the last timestep,
    # so we just return the next amount of geodes
    return geode + geode_robots if time == 1

    # If we can build a geode robot, do it
    if ore >= costs[GEODE][ORE] && obsidian >= costs[GEODE][OBSIDIAN]
      # We can build a geode robot
      return backtrack(
        costs,
        time - 1,
        ore_robots,
        clay_robots,
        obsidian_robots,
        geode_robots + 1,
        ore - costs[GEODE][ORE] + ore_robots,
        clay + clay_robots,
        obsidian - costs[GEODE][OBSIDIAN] + obsidian_robots,
        geode + geode_robots
      )
    end

    # We need to choose between obsidian, clay, and ore robots; or nothing
    possible = []

    if ore >= costs[OBSIDIAN][ORE] && clay >= costs[OBSIDIAN][CLAY]
      # We can build an obsidian robot
      possible << backtrack(
        costs,
        time - 1,
        ore_robots,
        clay_robots,
        obsidian_robots + 1,
        geode_robots,
        ore - costs[OBSIDIAN][ORE] + ore_robots,
        clay - costs[OBSIDIAN][CLAY] + clay_robots,
        obsidian + obsidian_robots,
        geode + geode_robots
      )
    end

    if ore >= costs[CLAY][ORE]
      # We can build a clay robot
      possible << backtrack(
        costs,
        time - 1,
        ore_robots,
        clay_robots + 1,
        obsidian_robots,
        geode_robots,
        ore - costs[CLAY][ORE] + ore_robots,
        clay + clay_robots,
        obsidian + obsidian_robots,
        geode + geode_robots
      )
    end

    if ore >= costs[ORE][ORE]
      # We can build an ore robot
      possible << backtrack(
        costs,
        time - 1,
        ore_robots + 1,
        clay_robots,
        obsidian_robots,
        geode_robots,
        ore - costs[ORE][ORE] + ore_robots,
        clay + clay_robots,
        obsidian + obsidian_robots,
        geode + geode_robots
      )
    end

    if ore < $max_ore_cost
      # Do nothing
      possible << backtrack(
        costs,
        time - 1,
        ore_robots,
        clay_robots,
        obsidian_robots,
        geode_robots,
        ore + ore_robots,
        clay + clay_robots,
        obsidian + obsidian_robots,
        geode + geode_robots
      )
    end

    possible.max
  end
end

# PART 1
t = Time.now
result = blueprints.map.with_index do |blueprint, idx|
  backtrack(blueprint, 24) * (idx + 1)
end.sum

puts result
puts "Took #{Time.now - t} seconds"

# PART 2
t = Time.now
result = blueprints.take(3).map do |blueprint|
  backtrack(blueprint, 32)
end.reduce(&:*)

puts result
puts "Took #{Time.now - t} seconds"
