1.upto(99) do |noun|
  1.upto(99) do |verb|
    program = File.read('day2.input').split(',').map(&:to_i)
    program[1] = noun
    program[2] = verb
    pc = 0

    loop do
      opcode = program[pc]
      op1_address = program[pc+1]
      op2_address = program[pc+2]
      op3_address = program[pc+3]
      op1 = program[op1_address]
      op2 = program[op2_address]

      case opcode
      when 1
        program[op3_address] = op1 + op2
      when 2
        program[op3_address] = op1 * op2
      when 99
        break
      else
        puts "Weird opcode: #{opcode}"
      end

      pc += 4
    end

    if program[0] == 19690720
      puts "Noun: #{noun} Verb: #{verb} 100*Noun+Verb = #{100*noun+verb}"
      exit
    end
  end
end
