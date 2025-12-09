require_relative "../advent_of_code"

input = <<~INPUT.strip
L68
L30
R48
L5
R60
L55
L1
L99
R14
L82
INPUT

dial = 50
password1 = 0
password2 = 0

@input.lines.each do |line|
  turn = line[0]
  steps = line[1..].to_i

  steps.times do
    dial += turn == "L" ? -1 : 1
    dial %= 100
    password2 += 1 if dial.zero?
  end

  password1 += 1 if dial.zero?
end

print_part1 password1
print_part2 password2
