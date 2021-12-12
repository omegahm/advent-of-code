input = File.readlines('day9.input').map(&:to_i)

# PART 1
input.each_cons(26) do |numbers|
  preamble = numbers.take(25)
  new_number = numbers.last
  found = preamble.combination(2).any? do |pair|
    pair.sum == new_number
  end
  puts new_number unless found
end

# PART 2
weakness = 26134589

(2..input.size).each do |i|
  input.each_cons(i) do |numbers|
    if numbers.sum == weakness
      #puts "numbers: #{numbers} (size: #{i})"
      #puts "smallest: #{numbers.min} largest: #{numbers.max} sum: #{numbers.min + numbers.max}"
      #exit
    end
  end
end

# Codegolfed
# cat day9.input | ruby 9.rb
(f=$<.readlines.map &:to_i).each_cons(26){|*n,b|n.combination(2).any?{|c|c.sum==b}||2.upto(f.size){|i|f.each_cons(i){|n|p b,n.minmax.sum if n.sum==b}}}
