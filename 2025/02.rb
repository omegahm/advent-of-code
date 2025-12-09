require_relative "../advent_of_code"

input = <<~INPUT.strip
11-22,95-115,998-1012,1188511880-1188511890,222220-222224,
1698522-1698528,446443-446449,38593856-38593862,565653-565659,
824824821-824824827,2121212118-2121212124
INPUT

invalid_sum1 = 0
invalid_sum2 = 0

@input.split(",").map do |ranges|
  a, b = ranges.split("-").map(&:to_i)
  (a..b).each do |n|
    s = n.to_s
    invalid_sum1 += n if s =~ /^(.*?)\1$/
    invalid_sum2 += n if s =~ /^(.*?)(\1){1,}$/
  end
end

print_part1 invalid_sum1
print_part2 invalid_sum2
