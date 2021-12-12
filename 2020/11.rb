seats = File.readlines('day11.input').map(&:chomp).map(&:chars)

new_seats = Marshal.load(Marshal.dump(seats))

loop do
  changed = false
  seats.each_with_index do |row, i|
    row.each_with_index do |seat, j|
      occupied = 0

      # PART 1
      # occupied += 1 if i != 0 && j != 0 && seats[i-1][j-1] == "#"
      # occupied += 1 if i != 0 && seats[i-1][j] == "#"
      # occupied += 1 if i != 0 && j != row.size-1 && seats[i-1][j+1] == "#"

      # occupied += 1 if j != 0 && seats[i][j-1] == "#"
      # occupied += 1 if j != row.size-1 && seats[i][j+1] == "#"

      # occupied += 1 if i != seats.size-1 && j != 0 && seats[i+1][j-1] == "#"
      # occupied += 1 if i != seats.size-1 && seats[i+1][j] == "#"
      # occupied += 1 if i != seats.size-1 && j != row.size-1 && seats[i+1][j+1] == "#"

      # PART 2
      occupied += 1 if (i-1).downto(0).zip((j-1).downto(0)).map { |a, b| a && b && seats[a][b] }.join.gsub(/\./, '')[0] == "#"
      occupied += 1 if (i-1).downto(0).map { |a| seats[a][j] }.join.gsub(/\./, '')[0] == "#"
      occupied += 1 if (i-1).downto(0).zip((j+1).upto(row.size-1)).map { |a, b| a && b && seats[a][b] }.join.gsub(/\./, '')[0] == "#"
      
      occupied += 1 if (j-1).downto(0).map { |b| seats[i][b] }.join.gsub(/\./, '')[0] == "#"
      occupied += 1 if (j+1).upto(row.size-1).map { |b| seats[i][b] }.join.gsub(/\./, '')[0] == "#"
      
      occupied += 1 if (i+1).upto(seats.size-1).zip((j-1).downto(0)).map { |a, b| a && b && seats[a][b] }.join.gsub(/\./, '')[0] == "#"
      occupied += 1 if (i+1).upto(seats.size-1).map { |a| seats[a][j] }.join.gsub(/\./, '')[0] == "#"
      occupied += 1 if (i+1).upto(seats.size-1).zip((j+1).upto(row.size-1)).map { |a, b| a && b && seats[a][b] }.join.gsub(/\./, '')[0] == "#"

      new_seats[i][j] = if seat == 'L' && occupied == 0
        changed = true
        "#"
      # PART 1
      #elsif seat == '#' && occupied >= 4
      # PART 2
      elsif seat == '#' && occupied >= 5
        changed = true
        "L"
      else
        seats[i][j]
      end
    end
  end
  seats = new_seats
  new_seats = Marshal.load(Marshal.dump(seats))
  break unless changed
end

puts seats.join.count("#")