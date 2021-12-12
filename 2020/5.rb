input = File.readlines('day5.input')

seat_ids = input.map do |line|
  row, column = line.slice(0, 7), line.slice(7, 3)
  row = row.tr('FB', '01').to_i(2)
  column = column.tr('LR', '01').to_i(2)
  row * 8 + column
end

# PART 1
puts seat_ids.max

# PART 2
puts (0..2000).select { |id| !seat_ids.include?(id) && seat_ids.include?(id-1) && seat_ids.include?(id+1) }.inspect
