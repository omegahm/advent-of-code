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
def backtrack(costs, time, robots = [1, 0, 0, 0], resources = [0, 0, 0, 0])
  $memo[[costs, time, robots, resources]] ||= begin
    next_resources = [
      resources[ORE] + robots[ORE],
      resources[CLAY] + robots[CLAY],
      resources[OBSIDIAN] + robots[OBSIDIAN],
      resources[GEODE] + robots[GEODE],
    ]

    # We cannot benefit from building on the last timestep,
    # so we just return the next amount of geodes
    return next_resources[GEODE] if time == 1

    # If we can build a geode robot, do it
    if resources[ORE] >= costs[GEODE][ORE] && resources[OBSIDIAN] >= costs[GEODE][OBSIDIAN]
      # We can build a geode robot
      new_robots = robots.dup
      new_robots[GEODE] += 1
      new_resources = next_resources.dup
      new_resources[ORE] -= costs[GEODE][ORE]
      new_resources[OBSIDIAN] -= costs[GEODE][OBSIDIAN]

      return backtrack(costs, time - 1, new_robots, new_resources)
    end

    # We need to choose between obsidian, clay, and ore robots; or nothing
    possible = []

    if resources[ORE] >= costs[OBSIDIAN][ORE] && resources[CLAY] >= costs[OBSIDIAN][CLAY]
      # We can build an obsidian robot
      new_robots = robots.dup
      new_robots[OBSIDIAN] += 1
      new_resources = next_resources.dup
      new_resources[ORE] -= costs[OBSIDIAN][ORE]
      new_resources[CLAY] -= costs[OBSIDIAN][CLAY]

      possible << backtrack(costs, time - 1, new_robots, new_resources)
    end

    if resources[ORE] >= costs[CLAY][ORE]
      # We can build a clay robot
      new_robots = robots.dup
      new_robots[CLAY] += 1
      new_resources = next_resources.dup
      new_resources[ORE] -= costs[CLAY][ORE]
      possible << backtrack(costs, time - 1, new_robots, new_resources)
    end

    if resources[ORE] >= costs[ORE][ORE]
      # We can build an ore robot
      new_robots = robots.dup
      new_robots[ORE] += 1
      new_resources = next_resources.dup
      new_resources[ORE] -= costs[ORE][ORE]
      possible << backtrack(costs, time - 1, new_robots, new_resources)
    end

    if resources[ORE] < $max_ore_cost
      # Do nothing
      possible << backtrack(costs, time - 1, robots.dup, next_resources.dup)
    end

    possible.max
  end
end

# PART 1
result = blueprints.map.with_index do |blueprint, idx|
  backtrack(blueprint, 24) * (idx + 1)
end.sum

puts result

# PART 2
result = blueprints.take(3).map do |blueprint|
  backtrack(blueprint, 32)
end.reduce(&:*)

puts result
