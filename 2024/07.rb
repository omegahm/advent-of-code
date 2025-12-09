require_relative "../advent_of_code"

input = <<~INPUT.strip
190: 10 19
3267: 81 40 27
83: 17 5
156: 15 6
7290: 6 8 6 15
161011: 16 10 13
192: 17 8 14
21037: 9 7 18 13
292: 11 6 16 20
INPUT

def valid_equation?(sum, operands, ops = [:+, :*])
  ops.repeated_permutation(operands.size-1).any? do |operators|
    inner_operands = operands.dup
    operators.map { |operator|
      inner_operands.unshift(
        operator == :concat ?
          "#{inner_operands.shift}#{inner_operands.shift}".to_i :
          inner_operands.shift.public_send(operator, inner_operands.shift)
      )
    }[0][0] == sum
  end
end

valid_part1_sum = 0
valid_part2_sum = 0

input.lines.each do
  sum, operands = _1.split(":")
  sum = sum.to_i
  operands = operands.split(" ").map(&:to_i)

  valid_part1_sum += sum if valid_equation?(sum, operands)
  valid_part2_sum += sum if valid_equation?(sum, operands, [:+, :*, :concat])
end

print_part1 valid_part1_sum
print_part2 valid_part2_sum
