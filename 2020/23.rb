# input = "389125467".chars.map(&:to_i) # EXAMPLE INPUT
input = "318946572".chars.map(&:to_i)

current_idx = 0
100.times do
  current_cup = input[current_idx]

  three_cups = input.slice!(current_idx+1, 3)
  three_cups.push(input.shift) until three_cups.size == 3
  destination = current_cup - 1
  until input.include?(destination)
    destination = destination - 1
    destination = input.max if destination < 0
  end

  input[input.index(destination)] = [input[input.index(destination)], *three_cups]
  input.flatten!

  current_idx = (input.index(current_cup) + 1) % input.size
end

input = input.rotate until input[0] == 1
puts input[1..].join

# PART 2
input = "318946572".chars.map(&:to_i)
input += (10..1_000_000).to_a

Cup = Struct.new(:value, :next)

cups = {}
input.each_with_index { |value, idx| cups[idx] = Cup.new(value) }
input.each_with_index { |_, idx| cups[idx].next = idx == cups.size - 1 ? cups[0] : cups[idx+1] }

value_map = {}
cups.each { |_, cup| value_map[cup.value] = cup }

head = cups[0]

10_000_000.times do |turn|
  three_cups = [head.next.value, head.next.next.value, head.next.next.next.value]
  new_head = head.next
  head.next = head.next.next.next.next

  current = head.value - 1

  loop do
    current -= 1 while three_cups.include?(current)
    current += cups.size if current == 0
    current -= 1 while three_cups.include?(current)

    pos = value_map[current]
    if pos
      new_head.next.next.next = pos.next
      pos.next = new_head
      break
    end

    current -= 1
  end

  head = head.next
end

one = value_map[1]
puts one.next.value * one.next.next.value
