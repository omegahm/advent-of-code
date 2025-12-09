require_relative "../advent_of_code"

input = <<~INPUT.strip
Register A: 729
Register B: 0
Register C: 0

Program: 0,1,5,4,3,0
INPUT

registers, program = @input.split("\n\n")
registers = registers.split("\n").map { _1.scan(/\d+/)[0].to_i }
program = program.sub("Program: ", "").split(",").map(&:to_i)

def combo(ip, program, registers)
  case program[ip+1]
  when 0..3
    program[ip+1]
  when 4
    registers[0]
  when 5
    registers[1]
  when 6
    registers[2]
  else
    fail "BAD COMBO"
  end
end

def run(program, registers)
  ip = 0

  out = []

  until ip >= program.size
    case program[ip]
    when 0, 6, 7 # adv, bdv, cdv
      num = registers[0]
      den = combo(ip, program, registers)
      idx = { 0 => 0, 6 => 1, 7 => 2}[program[ip]]
      registers[idx] = num >> den
    when 1 # bxl
      registers[1] ^= program[ip+1]
    when 2 # bst
      registers[1] = combo(ip, program, registers) % 8
    when 3 # jnz
      ip = program[ip+1] - 2 unless registers[0] == 0
    when 4 # bxc
      registers[1] ^= registers[2]
    when 5 # out
      out << combo(ip, program, registers) % 8
    end

    ip += 2
  end

  out
end

print_part1 run(program, registers).join(",")

valid = [0]
(1..program.size).each do |size|
  new_valid = []

  valid.each do |num|
    (0..7).each do |offset|
      newnum = 8 * num + offset
      new_valid << newnum if run(program, [newnum, 0, 0]) == program.last(size)
    end
  end

  valid = new_valid
end

print_part2 valid.min
