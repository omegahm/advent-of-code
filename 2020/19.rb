input = File.read('day19.input')

rules, values = input.split("\n\n").map { |line| line.split("\n") }
rules_hash = {}

rules.each do |rule|
  rule_num, rule_val = rule.split(': ')
  rules_hash[rule_num] = rule_val.gsub(/"/, '').split(' | ').map { |r| r.split(' ') }
end

max_as = values.map { |val| val.scan(/a+/).max_by(&:size).size }.max

# PART = 1
PART = 2

loop do
  current_key = rules_hash.keys.map(&:to_i).max.to_s
  break if current_key == '0'

  if PART == 2
    case current_key
    when '8'
      rules_hash[current_key][0][0] = "(#{rules_hash[current_key][0][0]})+"
    when '11'
      rule_1, rule_2 = rules_hash[current_key][0]
      2.upto(max_as) do |t|
        rules_hash[current_key] << [
          "#{rule_1}{#{t}}",
          "#{rule_2}{#{t}}"
        ]
      end
    end
  end

  new_rule = "(#{rules_hash[current_key].map { |current_rule| "(#{current_rule.join(" ")})" }.join('|')})"

  rules_hash.each do |key, value|
    rules_hash[key] = rules_hash[key].map { |arr| arr.map { |r| r.gsub(/(?<!\{)#{current_key}/, new_rule) } }
  end

  rules_hash.delete(current_key)
end

regexes = rules_hash["0"].map(&:join).map do |rule|
  rule = rule.gsub("((a))", "(a)") while rule.include?("((a))")
  rule = rule.gsub("((b))", "(b)") while rule.include?("((b))")
  rule = rule.gsub("((a) (a))", "aa")
             .gsub("((a) (b))", "ab")
             .gsub("((b) (a))", "ba")
             .gsub("((b) (b))", "bb")
             .gsub("(a)|(b)", "a|b")
             .gsub(" ", "")
             .gsub("(a)", "a")
             .gsub("(b)", "b")
             .gsub("a(aa)", "aaa")
             .gsub("a(ab)", "aab")
             .gsub("a(ba)", "aba")
             .gsub("a(bb)", "abb")
             .gsub("b(aa)", "baa")
             .gsub("b(ab)", "bab")
             .gsub("b(ba)", "bba")
             .gsub("b(bb)", "bbb")
             .gsub("(aaa)", "aaa")
             .gsub("(bbb)", "bbb")
  puts rule.size
  Regexp.new("^#{rule}$", Regexp::EXTENDED)
end

puts regexes.inspect

results = values.select do |value|
  regexes.any? { |r| r === value }
end

puts results.size
