require_relative "../advent_of_code"

input = "125 17"

input = @input.split(" ").each_with_object({}) { |stone, hash| hash[stone.to_i] = 1 }

def solve(stones, blinks)
  blinks.times do
    cache = Hash.new(0)

    stones.each do |stone, count|
      if stone == 0
        cache[1] += count
      elsif Integer(Math.log10(stone)).odd?
        lhs, rhs = stone.divmod(10 ** ((Integer(Math.log10(stone))+1)/2))

        cache[lhs] += count
        cache[rhs] += count
      else
        cache[stone * 2024] += count
      end
    end

    stones = cache
  end

  stones.values.sum
end

print_part1 solve(input, 25)
print_part2 solve(input, 75)
