time, ids = File.readlines('day13.input')
time = time.to_i
ids = ids.split(',').map(&:to_i)

t, id = ids.reject(&:zero?).map do |i|
  t = time
  until t % i == 0
    t += 1
  end
  [t, i]
end.min_by(&:first)

# PART 1
puts (t - time) * id

# PART 2
mult = id[0]
result = 0

ids.each_with_index do |i, idx|
  next if i == 0

  loop do
    if (result + idx) % i == 0
      mult *= i
      break
    end
    result += mult
  end
end

puts result