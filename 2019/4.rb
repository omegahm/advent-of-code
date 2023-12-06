result = (153517 .. 630395).select do |n|
  /(.)\1/ === n.to_s && n.to_s.chars.each_cons(2).all? { _1[0] <= _1[1] }
end

puts "Part 1: #{result.size}"

result = (153517 .. 630395).select do |n|
  n.to_s.scan(/((.)\2+)/).any? { _1[0].size == 2 } &&
    n.to_s.chars.each_cons(2).all? { _1[0] <= _1[1] } && n.to_s.scan(/(.)\1/)
end

puts "Part 2: #{result.size}"
