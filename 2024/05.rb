require_relative "../advent_of_code"

input = <<~INPUT.strip
47|53
97|13
97|61
97|47
75|29
61|13
75|53
29|13
97|29
53|29
61|53
97|53
61|29
47|13
75|47
97|75
47|61
75|61
47|29
75|13
53|13

75,47,61,53,29
97,61,53,29,13
75,29,13
75,97,47,61,53
61,13,29
97,13,75,29,47
INPUT

$rules, printings = @input.split("\n\n").map { _1.split("\n") }
$rules = $rules.map { _1.split("|").map(&:to_i) }
printings = printings.map { _1.split(",").map(&:to_i) }

def valid?(printing)
  idx = 0

  until idx == printing.size - 1
    return false unless printing[idx+1..].all? do |n|
      $rules.include?([printing[idx], n])
    end
    idx += 1
  end

  true
end


valid_printings = printings.select { valid?(_1) }
print_part1 valid_printings.sum { |printing| printing[printing.size / 2] }

invalid_printings = printings.reject { valid?(_1) }

corrected_printings = invalid_printings.map do |printing|
  printing.sort do |a, b|
    n, _ = $rules.find { |r| r.include?(a) && r.include?(b) }
    n == a ? -1 : 1
  end
end

print_part2 corrected_printings.sum { |printing| printing[printing.size / 2] }
