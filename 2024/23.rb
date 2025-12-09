require_relative "../advent_of_code"

input = <<~INPUT
kh-tc
qp-kh
de-cg
ka-co
yn-aq
qp-ub
cg-tb
vc-aq
tb-ka
wh-tc
yn-cg
kh-ub
ta-co
de-co
tc-td
tb-wq
wh-td
ta-ka
td-qp
aq-cg
wq-ub
ub-vc
de-ta
wq-aq
wq-vc
wh-yn
ka-de
kh-ta
co-tc
wh-qp
tb-vc
td-yn
INPUT

connections = @input.split("\n").map { |line| line.split("-") }

groups = Hash.new { |h, k| h[k] = [] }

connections.each do |a, b|
  groups[a] << b
  groups[b] << a
end

ts = groups.select { |node, _neighbours| node.start_with?("t") }
threes = Set.new

ts.each do |node, neighbours|
  neighbours.each do |neighbour|
    groups[neighbour].each do |neighbour_neighbour|
      if groups[neighbour_neighbour].include?(node)
        threes << [node, neighbour, neighbour_neighbour].sort
      end
    end
  end
end

print_part1 threes.size

def clique?(groups, nodes)
  nodes.combination(2).all? do |(a, b)|
    groups[a].include?(b)
  end
end

def largest_clique_with_node(groups, node)
  groups[node].size.downto(1) do |size|
    groups[node].combination(size) do |clique|
      return clique if clique?(groups, [node, *clique])
    end
  end

  # Always possible to find a clique of size 2
  fail "Not possible"
end

result = []

groups.keys.each do |node|
  clique = largest_clique_with_node(groups, node)
  result = clique if clique.size > result.size
end
print_part2 result.sort.join(',')
