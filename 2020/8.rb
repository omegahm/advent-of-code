program = File.readlines('day8.input').map(&:split)

# PART 1
# pc = 0
# visited_pc = []
# acc = 0
#
# until visited_pc.include?(pc)
#   visited_pc << pc
#   instr, arg = program[pc]
#   case instr
#   when 'acc'
#     acc += arg.to_i
#     pc += 1
#   when 'jmp'
#     pc += arg.to_i
#   when 'nop'
#     pc += 1
#   end
# end
#
# puts acc

# PART 2
program.each_with_index do |(jmp, jmparg), i|
  next unless jmp == 'jmp'
  next unless jmparg.to_i.negative?
  program[i][0] = 'nop'

  pc = 0
  visited_pc = []
  acc = 0

  until pc > program.size
    break if visited_pc.include?(pc)

    visited_pc << pc
    instr, arg = program[pc]

    case instr
    when 'acc'
      acc += arg.to_i
      pc += 1
    when 'jmp'
      pc += arg.to_i
    when 'nop'
      pc += 1
    end

    if pc == program.size
      puts "acc: #{acc} i: #{i}"
    end
  end

  program[i][0] = 'jmp'
end
