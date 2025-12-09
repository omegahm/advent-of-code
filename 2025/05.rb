require_relative "../advent_of_code"

input = <<~INPUT.strip
3-5
10-14
16-20
12-18

1
5
8
11
17
32
INPUT

fresh_ranges, available = @input.split("\n\n")
fresh_ranges = fresh_ranges.split("\n").map do |line|
  a, b = line.split("-").map(&:to_i)
  (a..b)
end.sort_by(&:begin)
available = available.split("\n").map(&:to_i)

fresh_size = available.count do |id|
  fresh_ranges.any? { |range| range.include?(id) }
end

valid_ranges = []
fresh_ranges.each do |range|
  valid_ranges.each do |other|
    rb, re = range.begin, range.end
    ob, oe = other.begin, other.end

    if (rb >= ob && rb <= oe) ||
        (re >= ob && re <= oe) ||
        (ob >= rb && ob <= re) ||
        (oe >= rb && oe <= re)
      range = ([rb, ob].min..[re, oe].max)
      valid_ranges.delete(other)
    end
  end
  valid_ranges << range
end

print_part1 fresh_size
print_part2 valid_ranges.sum(&:size)
