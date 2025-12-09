require_relative "../advent_of_code"

input = <<~INPUT.strip
987654321111111
811111111111119
234234234234278
818181911112111
INPUT

##
## First solution that was infeasible for part 2
##
# joltage = 0
# @input.split("\n").each do |line|
#   nums = line.chars.map(&:to_i)
#   joltage += nums.combination(2).map(&:join).map(&:to_i).max
# end
# puts joltage

def solve(input, battery_size)
  result = 0

  input.split("\n").each do |line|
    nums = line.chars.map(&:to_i)
    joltage = []

    battery_size.downto(1) do |n|
      search_nums = nums.take(nums.size - n + 1)
      max_index = search_nums.index(search_nums.max)
      joltage << search_nums[max_index]
      nums = nums.drop(max_index + 1)
    end

    result += joltage.join.to_i
  end

  result
end

print_part1 solve(@input,  2)
print_part2 solve(@input, 12)
