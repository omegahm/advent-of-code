require_relative "../advent_of_code"

input = <<~INPUT.strip
[.##.] (3) (1,3) (2) (2,3) (0,2) (0,1) {3,5,4,7}
[...#.] (0,2,3,4) (2,3) (0,4) (0,1,2) (1,2,3,4) {7,5,12,7,2}
[.###.#] (0,1,2,3,4) (0,3,4) (0,1,2,4,5) (1,2) {10,11,11,5,10,5}
INPUT

input = @input

machines_part1 = input.split("\n").map do |line|
  lights, *buttons, _ = line.split(" ")

  new_lights = lights[1..-2].chars.map { _1 == "#" ? 1 : 0 }.join.to_i(2)

  buttons = buttons.flat_map do
    _1.split(" ").map do |button|
      button[1..-2].split(",").sum do |n|
        2 ** (lights.size - 3 - n.to_i)
      end
    end
  end

  [new_lights, buttons]
end

part1 = 0
machines_part1.each do |lights, buttons|
  i = 1
  found = false

  loop do
    buttons.repeated_permutation(i) do |combo|
      state = 0
      combo.each { |b| state ^= b }

      if state == lights
        found = true
        part1 += i
        break
      end
    end

    i += 1
    break if found
  end
end

print_part1 part1

machines_part2 = input.split("\n").map do |line|
  _, *buttons, joltage = line.split(" ")

  buttons = buttons.flat_map do
    _1.split(" ").map do |button|
      button[1..-2].split(",").map(&:to_i)
    end
  end

  joltage = joltage[1..-2].split(",").map(&:to_i)

  [buttons, joltage]
end

require "z3"

result = 0
machines_part2.each do |buttons, joltage|
  opt = Z3::Optimize.new

  press_count = []
  buttons.size.times do |idx|
    count = Z3.Int("button_#{idx}")
    press_count << count
    # All buttons must be pressed a non-negative number of times
    opt.assert(count >= 0)
  end

  joltage.each_with_index do |jolts, idx|
    # Sum all presses that a button affects
    press = []
    buttons.each_with_index do |button, jdx|
      press << press_count[jdx] if button.include?(idx)
    end
    # ... the sum must be equal to the required joltage
    opt.assert(press.sum == jolts)
  end

  # Minimize the total number of presses
  opt.minimize(press_count.sum)

  if opt.check == :sat
    opt.model.each do |_, value|
      result += value.to_i
    end
  else
    fail "No solution found"
  end
end

print_part2 result
