require_relative "../advent_of_code"

input = <<~INPUT
x00: 1
x01: 1
x02: 1
y00: 0
y01: 1
y02: 0

x00 AND y00 -> z00
x01 XOR y01 -> z01
x02 OR y02 -> z02
INPUT

input = <<~INPUT
x00: 1
x01: 0
x02: 1
x03: 1
x04: 0
y00: 1
y01: 1
y02: 1
y03: 1
y04: 1

ntg XOR fgs -> mjb
y02 OR x01 -> tnw
kwq OR kpj -> z05
x00 OR x03 -> fst
tgd XOR rvg -> z01
vdt OR tnw -> bfw
bfw AND frj -> z10
ffh OR nrd -> bqk
y00 AND y03 -> djm
y03 OR y00 -> psh
bqk OR frj -> z08
tnw OR fst -> frj
gnj AND tgd -> z11
bfw XOR mjb -> z00
x03 OR x00 -> vdt
gnj AND wpb -> z02
x04 AND y00 -> kjc
djm OR pbm -> qhw
nrd AND vdt -> hwm
kjc AND fst -> rvg
y04 OR y02 -> fgs
y01 AND x02 -> pbm
ntg OR kjc -> kwq
psh XOR fgs -> tgd
qhw XOR tgd -> z09
pbm OR djm -> kpj
x03 XOR y03 -> ffh
x00 XOR y04 -> ntg
bfw OR bqk -> z06
nrd XOR fgs -> wpb
frj XOR qhw -> z04
bqk OR frj -> z07
y03 OR x01 -> nrd
hwm AND bqk -> z03
tgd XOR rvg -> z12
tnw OR pbm -> gnj
INPUT

values, equations = @input.split("\n\n").map { |part| part.split("\n") }
values = values.map do |line|
  var, value = line.split(": ")
  [var, value.to_i]
end.to_h

equations = equations.map do |line|
  inputs, output = line.split(" -> ")
  a, op, b = inputs.split(" ")

  values[a] = nil unless values.key?(a)
  values[b] = nil unless values.key?(b)
  values[output] = nil

  [a, op, b, output]
end

def solve(equations, values)
  equations = equations.dup
  values = values.dup

  until equations.empty?
    equations.map! do |equation|
      a, op, b, output = equation
      next equation if values[a].nil? || values[b].nil? || !values[output].nil?

      case op
      when "AND"
        values[output] = values[a] & values[b]
      when "OR"
        values[output] = values[a] | values[b]
      when "XOR"
        values[output] = values[a] ^ values[b]
      end

      if values[output].nil?
        equation
      else
        nil
      end
    end

    equations.compact!
  end

  values
end

result = solve(equations, values).sort_by { _1 }.reverse.to_h
print_part1 result.select { _1.start_with?("z") }.map { _2 }.join.to_i(2)

# Found by looking at Graphviz output
# z09, gbf, z30, nbf, z05, hdt, mht, jgt
equations.map! do |(a, op, b, output)|
  output = {
    "z09" => "gbf",
    "gbf" => "z09",
    "z30" => "nbf",
    "nbf" => "z30",
    "z05" => "hdt",
    "hdt" => "z05",
    "mht" => "jgt",
    "jgt" => "mht",
  }.fetch(output, output)

  [a, op, b, output]
end

puts "\ndigraph {"

equations.each do |(a, op, b, output)|
  puts "  #{a} [style=filled, fillcolor=red]" if a.start_with?("x")
  puts "  #{b} [style=filled, fillcolor=red]" if b.start_with?("x")

  puts "  #{a} [style=filled, fillcolor=blue]" if a.start_with?("y")
  puts "  #{b} [style=filled, fillcolor=blue]" if b.start_with?("y")

  puts "  #{output} [style=filled, fillcolor=green]" if output.start_with?("z")

  puts "  #{a} [shape=square, fixedsize=true, width=.75, height=.75];"
  puts "  #{b} [shape=square, fixedsize=true, width=.75, height=.75];"
  puts "  #{a}_#{op}_#{b} [shape=square, fixedsize=true, width=.75, height=.75, label=\"#{op}\"];"
  puts "  #{output} [shape=square, fixedsize=true, width=.75, height=.75];"

  puts "  #{a} -> #{a}_#{op}_#{b};"
  puts "  #{b} -> #{a}_#{op}_#{b};"
  puts "  #{a}_#{op}_#{b} -> #{output};"
end
puts "}"
puts "\n"

result = solve(equations, values).sort_by { _1 }.reverse.to_h
x = result.select { _1.start_with?("x") }.map { _2 }.join
y = result.select { _1.start_with?("y") }.map { _2 }.join
z = result.select { _1.start_with?("z") }.map { _2 }.join

puts x.rjust(z.size, " ")
puts "+".rjust(z.size, " ")
puts y.rjust(z.size, " ")
puts "=".rjust(z.size, " ")
puts z

expected = (x.to_i(2) + y.to_i(2)).to_s(2)
puts "\nExpected:\n#{expected}"
puts "Equal:\n#{expected == z}"

puts "\n---\n\n"

puts x.to_i(2)
puts "+"
puts y.to_i(2)
puts "="
puts z.to_i(2)

expected = (x.to_i(2) + y.to_i(2))
puts "\nExpected:\n#{expected}"
puts "Equal:\n#{expected == z.to_i(2)}"

print_part2 "Found by visual inspection: #{%w(z09 gbf z30 nbf z05 hdt mht jgt).sort.join(",")}"
