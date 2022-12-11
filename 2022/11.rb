input = <<~INPUT
Monkey 0:
  Starting items: 79, 98
  Operation: new = old * 19
  Test: divisible by 23
    If true: throw to monkey 2
    If false: throw to monkey 3

Monkey 1:
  Starting items: 54, 65, 75, 74
  Operation: new = old + 6
  Test: divisible by 19
    If true: throw to monkey 2
    If false: throw to monkey 0

Monkey 2:
  Starting items: 79, 60, 97
  Operation: new = old * old
  Test: divisible by 13
    If true: throw to monkey 1
    If false: throw to monkey 3

Monkey 3:
  Starting items: 74
  Operation: new = old + 3
  Test: divisible by 17
    If true: throw to monkey 0
    If false: throw to monkey 1
INPUT

input = <<~INPUT
Monkey 0:
  Starting items: 92, 73, 86, 83, 65, 51, 55, 93
  Operation: new = old * 5
  Test: divisible by 11
    If true: throw to monkey 3
    If false: throw to monkey 4

Monkey 1:
  Starting items: 99, 67, 62, 61, 59, 98
  Operation: new = old * old
  Test: divisible by 2
    If true: throw to monkey 6
    If false: throw to monkey 7

Monkey 2:
  Starting items: 81, 89, 56, 61, 99
  Operation: new = old * 7
  Test: divisible by 5
    If true: throw to monkey 1
    If false: throw to monkey 5

Monkey 3:
  Starting items: 97, 74, 68
  Operation: new = old + 1
  Test: divisible by 17
    If true: throw to monkey 2
    If false: throw to monkey 5

Monkey 4:
  Starting items: 78, 73
  Operation: new = old + 3
  Test: divisible by 19
    If true: throw to monkey 2
    If false: throw to monkey 3

Monkey 5:
  Starting items: 50
  Operation: new = old + 5
  Test: divisible by 7
    If true: throw to monkey 1
    If false: throw to monkey 6

Monkey 6:
  Starting items: 95, 88, 53, 75
  Operation: new = old + 8
  Test: divisible by 3
    If true: throw to monkey 0
    If false: throw to monkey 7

Monkey 7:
  Starting items: 50, 77, 98, 85, 94, 56, 89
  Operation: new = old + 2
  Test: divisible by 13
    If true: throw to monkey 4
    If false: throw to monkey 0
INPUT

def parse(input)
  monkeys = []

  factor = 1
  input.split("\n\n").each do |monkey_data|
    monkey = { inspections: 0, test: {} }

    monkey_data.lines.map(&:strip).each do |line|
      case line
      when /^Monkey (\d+):$/
        # no-op
      when /^Starting items: (.*)$/
        monkey[:items] = $1.split(', ').map(&:to_i)
      when /^Operation: new = old ([+*]) (.*)$/
        monkey[:operation] = [$1, $2]
      when /^Test: divisible by (\d+)$/
        monkey[:test][:divisible_by] = $1.to_i
        factor *= $1.to_i
      when /^If true: throw to monkey (\d+)$/
        monkey[:test][:true] = $1.to_i
      when /^If false: throw to monkey (\d+)$/
        monkey[:test][:false] = $1.to_i
      else
        throw "TILT"
      end
    end

    monkeys << monkey
  end

  [monkeys, factor]
end

def throw_around(monkeys, factor, stop_worrying)
  monkeys.each do |monkey|
    monkey[:items].each do |item|
      monkey[:inspections] += 1
      operator, operand = monkey[:operation]
      operand = item if operand == "old"
      item = (item.public_send(operator.to_sym, operand.to_i) / stop_worrying) % factor

      if item % monkey[:test][:divisible_by] == 0
        monkeys[monkey[:test][:true]][:items] << item
      else
        monkeys[monkey[:test][:false]][:items] << item
      end
    end

    monkey[:items] = []
  end
end

# PART 1
monkeys, factor = parse(input)
20.times do
  throw_around(monkeys, factor, 3)
end

puts monkeys.map { |monkey| monkey[:inspections] }.max(2).reduce(:*)

# PART 2
monkeys, factor = parse(input)
10_000.times do |i|
  throw_around(monkeys, factor, 1)
end

puts monkeys.map { |monkey| monkey[:inspections] }.max(2).reduce(:*)
