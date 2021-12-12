data = <<HERE
start-YA
ps-yq
zt-mu
JS-yi
yq-VJ
QT-ps
start-yq
YA-yi
start-nf
nf-YA
nf-JS
JS-ez
yq-JS
ps-JS
ps-yi
yq-nf
QT-yi
end-QT
nf-yi
zt-QT
end-ez
yq-YA
end-JS
HERE

# data = <<HERE
# start-A
# start-b
# A-c
# A-b
# b-d
# A-end
# b-end
# HERE

# data = <<HERE
# dc-end
# HN-start
# start-kj
# dc-start
# dc-HN
# LN-dc
# HN-end
# kj-sa
# kj-HN
# kj-dc
# HERE

# data = <<HERE
# fs-end
# he-DX
# fs-he
# start-DX
# pj-DX
# end-zg
# zg-sl
# zg-pj
# pj-he
# RW-he
# fs-DX
# pj-RW
# zg-RW
# start-pj
# he-WI
# zg-he
# pj-fs
# start-RW
# HERE

require 'set'

graph = Hash.new { |h, k| h[k] = [] }
data.lines.map(&:chomp).each do |line|
  a, b = line.split('-')
  graph[a] << b unless b == 'start' || a == 'end'
  graph[b] << a unless a == 'start' || b == 'end'
end

valid_paths = []
paths = [['start']]

until paths.empty?
  next_paths = []
  paths.each do |path|
    graph[path.last].each do |next_cave|
      next_path = path + [next_cave]

      if next_cave == 'end'
        valid_paths << next_path
        next
      end

      small_caves = next_path.select { |pa| /[a-z]/ === pa }
      # Remove + 1 for PART 1
      next if small_caves.size > small_caves.uniq.size + 1

      next_paths << next_path
    end

    paths = next_paths
  end
end

# valid_paths.each { |v| puts v.join(',').inspect }
puts valid_paths.size
