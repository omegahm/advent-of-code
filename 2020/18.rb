input = File.readlines('day18.input').map(&:chomp)

def part1_calc(tokens)
  result = tokens[0].to_i

  op = nil
  tokens[1..].each do |token|
    case token
    when '+', '*'
      op = token
    when /\d+/
      result = result.public_send(op, token.to_i)
    end
  end

  result
end

def part2_calc(tokens)
  tokens = tokens.dup

  while tokens.include?('+')
    plus_op_idx = tokens.index('+')
    tokens[plus_op_idx-1, 3] = tokens[plus_op_idx-1].to_i + tokens[plus_op_idx+1].to_i
  end

  while tokens.include?('*')
    mult_op_idx = tokens.index('*')
    tokens[mult_op_idx-1, 3] = tokens[mult_op_idx-1].to_i * tokens[mult_op_idx+1].to_i
  end

  tokens[0].to_i
end

result = input.map do |line|
  while line.include?('(')
    line = line.sub(/\([^\()]+\)/) do |exp|
      exp = exp[1..-2] if exp[0] == '('
      # part1_calc(exp.split(' '))
      part2_calc(exp.split(' '))
    end
  end
  # part1_calc(line.split(' '))
  part2_calc(line.split(' '))
end.sum

puts result
