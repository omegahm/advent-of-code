input = File.readlines('day10.input').map(&:to_i).sort

# PART 1
adapters = [0].concat(input)

diffs = [nil, 0, 0, 1]
adapters.each_cons(2) do |a, b|
  diffs[b-a] += 1
end

puts diffs[1] * diffs[3]

# PART 2
routes = {}
routes[0] = 1

adapters.drop(1).each do |a|
  routes[a] = routes.fetch(a-1, 0) + routes.fetch(a-2, 0) + routes.fetch(a-3, 0)
end

puts routes[adapters.max]

# Codegolfed
c=[0]*3+[1];([0]+(q=$<.readlines.map(&:to_i).sort)).each_cons(2){|a,b|c[b-a]+=1};p c[1]*c[3]
r={0=>1};q.each{|a|r[a]=(1..3).sum{|i|r.fetch(a-i,0)}};p r[q[-1]]
