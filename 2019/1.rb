def fuel_requirement(num)
  num.fdiv(3).floor - 2
end

sum = 0
File.readlines('day1.input').each do |line|
  f = line.to_i
  while f != 0
    f = fuel_requirement(f.to_i)
    f = 0 if f.negative?
    sum += f
  end
end

puts "Sum is #{sum}"
