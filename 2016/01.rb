input = <<~INPUT
R5, L5, R5, R3
INPUT

input = DATA.read

x, y = 0, 0

directions = [:north, :west, :south, :east]
direction_index = 0

already_visited = Set.new([[0, 0]])
first_visited_twice = nil

input.split(", ").each do |instruction|
  dir = instruction[0]
  steps = instruction[1..-1].to_i

  direction_index += { "R" => 1, "L" => -1 }[dir]

  steps.times do
    case directions[direction_index % 4]
    when :north
      y -= 1
    when :east
      x += 1
    when :south
      y += 1
    when :west
      x -= 1
    end

    if !first_visited_twice && already_visited.include?([x, y])
      first_visited_twice ||= [x, y]
    end

    already_visited << [x, y]
  end
end

puts "Part 1", x.abs + y.abs
puts "Part 2", first_visited_twice.map(&:abs).sum

__END__
L4, R2, R4, L5, L3, L1, R4, R5, R1, R3, L3, L2, L2, R5, R1, L1, L2, R2, R2, L5, R5, R5, L2, R1, R2, L2, L4, L1, R5, R2, R1, R1, L2, L3, R2, L5, L186, L5, L3, R3, L5, R4, R2, L5, R1, R4, L1, L3, R3, R1, L1, R4, R2, L1, L4, R5, L1, R50, L4, R3, R78, R4, R2, L4, R3, L4, R4, L1, R5, L4, R1, L2, R3, L2, R5, R5, L4, L1, L2, R185, L5, R2, R1, L3, R4, L5, R2, R4, L3, R4, L2, L5, R1, R2, L2, L1, L2, R2, L2, R1, L5, L3, L4, L3, L4, L2, L5, L5, R2, L3, L4, R4, R4, R5, L4, L2, R4, L5, R3, R1, L1, R3, L2, R2, R1, R5, L4, R5, L3, R2, R3, R1, R4, L4, R1, R3, L5, L1, L3, R2, R1, R4, L4, R3, L3, R3, R2, L3, L3, R4, L2, R4, L3, L4, R5, R1, L1, R5, R3, R1, R3, R4, L1, R4, R3, R1, L5, L5, L4, R4, R3, L2, R1, R5, L3, R4, R5, L4, L5, R2
