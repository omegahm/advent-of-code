input = <<~INPUT.strip
Time:      7  15   30
Distance:  9  40  200
INPUT

input = <<~INPUT.strip
Time:        38     94     79     70
Distance:   241   1549   1074   1091
INPUT

# PART 1
races = input.lines.map { |line| line.scan(/\d+/).map(&:to_i) }.transpose

def ways(time, distance)
  time.times.select do |holding|
    holding * (time - holding) > distance
  end
end

puts "Part 1", races.map { |(time, distance)| ways(time, distance).size }.reduce(:*)

# PART 2
time, distance = race = input.lines.map { _1.gsub(/[^\d]/, "").scan(/\d+/).map(&:to_i) }.flatten
puts "Part 2", ways(time, distance).size
