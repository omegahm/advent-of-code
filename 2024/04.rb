require_relative "../advent_of_code"

input = <<~INPUT.strip
MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX
INPUT

rows = @input.lines.map(&:strip).map(&:chars)

count = 0
rows.each_with_index do |row, idx|
  row.each_with_index do |elem, jdx|
    next unless elem == "X"
    mas = []

    mas << "#{row[jdx+1]}#{row[jdx+2]}#{row[jdx+3]}" if jdx+3 < row.size
    mas << "#{row[jdx-1]}#{row[jdx-2]}#{row[jdx-3]}" if jdx-3 >= 0

    mas << "#{rows[idx+1][jdx]}#{rows[idx+2][jdx]}#{rows[idx+3][jdx]}" if idx+3 < rows.size
    mas << "#{rows[idx-1][jdx]}#{rows[idx-2][jdx]}#{rows[idx-3][jdx]}" if idx-3 >= 0

    mas << "#{rows[idx+1][jdx+1]}#{rows[idx+2][jdx+2]}#{rows[idx+3][jdx+3]}" if idx+3 < rows.size && jdx+3 < row.size
    mas << "#{rows[idx-1][jdx-1]}#{rows[idx-2][jdx-2]}#{rows[idx-3][jdx-3]}" if idx-3 >= 0 && jdx-3 >= 0
    mas << "#{rows[idx+1][jdx-1]}#{rows[idx+2][jdx-2]}#{rows[idx+3][jdx-3]}" if idx+3 < rows.size && jdx-3 >= 0
    mas << "#{rows[idx-1][jdx+1]}#{rows[idx-2][jdx+2]}#{rows[idx-3][jdx+3]}" if idx-3 >= 0 && jdx+3 < row.size

    count += mas.count("MAS")
  end
end

print_part1 count

count = 0
rows.each_with_index do |row, idx|
  row.each_with_index do |elem, jdx|
    next unless elem == "A"
    next unless idx+1 < rows.size && idx-1 >= 0 && jdx+1 < row.size && jdx-1 >= 0

    next unless [rows[idx+1][jdx-1], rows[idx-1][jdx+1]].sort.join == "MS"
    next unless [rows[idx-1][jdx-1], rows[idx+1][jdx+1]].sort.join == "MS"

    count += 1
  end
end

print_part2 count
