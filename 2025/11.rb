require_relative "../advent_of_code"

input = <<~INPUT.strip
aaa: you hhh
you: bbb ccc
bbb: ddd eee
ccc: ddd eee fff
ddd: ggg
eee: out
fff: out
ggg: out
hhh: ccc fff iii
iii: out
INPUT

input = <<~INPUT.strip
svr: aaa bbb
aaa: fft
fft: ccc
bbb: tty
tty: ccc
ccc: ddd eee
ddd: hub
hub: fff
eee: dac
dac: fff
fff: ggg hhh
ggg: out
hhh: out
INPUT

def parse_input(input)
  {}.tap do |graph|
    input.split("\n").each do |line|
      node, edges = line.split(": ")
      graph[node] = edges.split(" ")
    end
  end
end

def find_paths(current, graph, part2 = nil, cache = {})
  return (part2.nil? || part2 == 0b11) ? 1 : 0 if current == "out"

  cache[[current, part2]] ||= begin
    graph[current].sum do |neighbour|
      if !part2.nil?
        part2 |= 0b01 if neighbour == "dac"
        part2 |= 0b10 if neighbour == "fft"
      end
      find_paths(neighbour, graph, part2, cache)
    end
  end
end

print_part1 find_paths("you", parse_input(@input))
print_part2 find_paths("svr", parse_input(@input), 0b00)
