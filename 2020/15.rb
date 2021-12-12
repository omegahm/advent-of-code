# PART 1
input = [0, 3, 6]
# input = [5, 2, 8, 16, 18, 0, 1]

until input.size == 2020
  n = input.last
  idx = input.slice(0, input.size - 1).rindex(n)

  if idx.nil?
    input << 0
  else
    input << input.size - idx - 1
  end
end

puts input[2020-1]

# PART 2
# input = [0, 3, 6]
input = [5, 2, 8, 16, 18, 0, 1]
indices = input.map.with_index { |a, i| [a, [nil, i+1]] }.to_h

current = input.last
(input.size..(30_000_000-1)).each do |i|
  a, b = indices[current]
  if a.nil?
    current = 0
    indices[0] = [indices[0][1], i+1]
  else
    current = b - a
    _, d = indices[current]
    indices[current] = [d, i+1]
  end
end
puts current
