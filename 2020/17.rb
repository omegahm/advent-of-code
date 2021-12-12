input = File.readlines('day17.example').map(&:chomp)

cube = {}

input.each_with_index do |row, x|
  cube[x] ||= {}
  row.chars.each_with_index do |cell, y|
    cube[x][y] ||= { 0 => { 0 => cell } }
  end
end

new_cube = Marshal.load(Marshal.dump(cube))

min = 0
max = input.size

neighbours = [-1, 0, 1].repeated_permutation(4).uniq.reject { |arr| arr == [0] * 4 }

6.times do
  ((min-1)..(max+1)).to_a.repeated_permutation(4).each do |x, y, z, w|
    active_neighbours = neighbours.select do |dx, dy, dz, dw|
      cube.dig(x+dx, y+dy, z+dz, w+dw) == '#'
    end.count

    new_cube[x] ||= {}
    new_cube[x][y] ||= {}
    new_cube[x][y][z] ||= {}

    new_cube[x][y][z][w] = if (cube.dig(x, y, z, w) == '#' && [2, 3].include?(active_neighbours)) || active_neighbours == 3
      '#'
    else
      '.'
    end
  end

  cube = new_cube
  new_cube = Marshal.load(Marshal.dump(cube))
  min -= 1
  max += 1
end

values = cube.values.map { |a| a.values.map { |b| b.values.map(&:values) } }.flatten
puts values.count('#')
