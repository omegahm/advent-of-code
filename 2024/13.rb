require_relative "../advent_of_code"

input = <<~INPUT.strip
Button A: X+94, Y+34
Button B: X+22, Y+67
Prize: X=8400, Y=5400

Button A: X+26, Y+66
Button B: X+67, Y+21
Prize: X=12748, Y=12176

Button A: X+17, Y+86
Button B: X+84, Y+37
Prize: X=7870, Y=6450

Button A: X+69, Y+23
Button B: X+27, Y+71
Prize: X=18641, Y=10279
INPUT

def solve(x1, y1, x2, y2, t1, t2)
  a = (t2 * x2 - t1 * y2) / (x2 * y1 - x1 * y2)
  b = (t2 * x1 - t1 * y1) / (x1 * y2 - x2 * y1)

  return 0 unless a % 1 == 0 && b % 1 == 0

  a * 3 + b
end

part1, part2 = [0, 0]
@input.split("\n\n").each do |lines|
  args = lines.split("\n").flat_map { _1.scan(/\d+/) }.map(&:to_f)

  part1 += solve(*args)

  args[-2] += 10**13
  args[-1] += 10**13
  part2 += solve(*args)
end

print_part1 part1.to_i
print_part2 part2.to_i
