data = <<HERE
4472562264
8631517827
7232144146
2447163824
1235272671
5133527146
6511372417
3841841614
8621368782
3246336677
HERE

# data = <<HERE
# 5483143223
# 2745854711
# 5264556173
# 6141336146
# 6357385478
# 4167524645
# 2176841721
# 6882881134
# 4846848554
# 5283751526
# HERE

# data = <<HERE
# 11111
# 19991
# 19191
# 19991
# 11111
# HERE

grid = data.lines.map(&:chomp).map { |line| line.chars.map(&:to_i) }

step = 0
loop do
  step += 1
  flashes = 0
  grid.each do |row|
    puts row.join
  end
  puts
  # Increase every octopus' energy level and find flashing octopi
  flashing = []
  grid.each_with_index do |row, idx|
    row.size.times do |jdx|
      grid[idx][jdx] += 1
      flashing << [idx, jdx] if grid[idx][jdx] == 10
    end
  end

  until flashing.empty?
    flashes += 1
    idx, jdx = flashing.pop

    unless idx == 0 || jdx == 0
      grid[idx-1][jdx-1] += 1
      flashing << [idx-1, jdx-1] if grid[idx-1][jdx-1] == 10
    end

    unless idx == 0
      grid[idx-1][jdx] += 1
      flashing << [idx-1, jdx] if grid[idx-1][jdx] == 10
    end

    unless idx == 0 || jdx == grid[idx-1].size-1
      grid[idx-1][jdx+1] += 1
      flashing << [idx-1, jdx+1] if grid[idx-1][jdx+1] == 10
    end

    unless jdx == 0
      grid[idx][jdx-1] += 1
      flashing << [idx, jdx-1] if grid[idx][jdx-1] == 10
    end

    unless jdx == grid[idx].size-1
      grid[idx][jdx+1] += 1
      flashing << [idx, jdx+1] if grid[idx][jdx+1] == 10
    end

    unless idx == grid.size-1 || jdx == 0
      grid[idx+1][jdx-1] += 1
      flashing << [idx+1, jdx-1] if grid[idx+1][jdx-1] == 10
    end

    unless idx == grid.size-1
      grid[idx+1][jdx] += 1
      flashing << [idx+1, jdx] if grid[idx+1][jdx] == 10
    end

    unless idx == grid.size-1 || jdx == grid[idx+1].size-1
      grid[idx+1][jdx+1] += 1
      flashing << [idx+1, jdx+1] if grid[idx+1][jdx+1] == 10
    end
  end

  grid.each_with_index do |row, idx|
    row.each_with_index do |energy, jdx|
      grid[idx][jdx] = 0 if energy > 9
    end
  end

  if flashes == grid.size * grid[0].size
    puts step
    break
  end
end
