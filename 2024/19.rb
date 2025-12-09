require_relative "../advent_of_code"

input = <<~INPUT.strip
r, wr, b, g, bwu, rb, gb, br

brwrr
bggr
gbbr
rrbgbr
ubwu
bwurrg
brgr
bbrgwb
INPUT

towels, patterns = @input.split("\n\n")
towels = towels.split(', ')
patterns = patterns.split("\n")

def combinations(towels, target_pattern)
  relevant_towels = towels.select { target_pattern.include?(_1) }
  dp = Hash.new(0)
  dp[0] = 1

  (1..target_pattern.size).each do |i|
    relevant_towels.each do |pattern|
      next if i < pattern.size

      if target_pattern[i - pattern.size...i] == pattern
        dp[i] += dp[i - pattern.size]
      end
    end
  end

  dp.fetch(target_pattern.size, nil)
end

towel_combinations = patterns.map { combinations(towels, _1) }.compact

print_part1 towel_combinations.count
print_part2 towel_combinations.sum
