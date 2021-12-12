public_keys = [11404017, 13768789]

loop_sizes = public_keys.map do |public_key|
  val = 1
  loop_size = 1

  loop do
    val = (val * 7) % 20201227
    break if val == public_key
    loop_size += 1
  end

  loop_size
end

puts (loop_sizes.zip(public_keys.reverse).map do |l, k|
  l.times.reduce(1) do |val|
    (val * k) % 20201227
  end
end.first)
