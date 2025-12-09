require_relative "../advent_of_code"

input = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
input = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"

result = @input.scan(/mul\((\d{1,3}),(\d{1,3})\)/).map { |a, b| a.to_i * b.to_i }.sum
print_part1 result

enabled = true
result = @input.scan(/(mul)\((\d{1,3}),(\d{1,3})\)|(do)\(\)|(don't)\(\)/).sum do |match|
  case match
  in ["mul", a, b, _, _]
    enabled ? a.to_i * b.to_i : 0
  in [_, _, _, "do", _]
    enabled = true
    0
  in [_, _, _, _, "don't"]
    enabled = false
    0
  end
end
print_part2 result
