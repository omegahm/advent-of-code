input = File.readlines('day2.input')

result = input.count do |str|
  num, char, password = str.split(/\s|: /)
  low, high = num.split('-').map(&:to_i)

  # PART 1
  # n = password.count(char)
  # low <= n && n <= high

  # PART 2
  [password[low-1], password[high-1]].count(char) == 1
end

puts result
