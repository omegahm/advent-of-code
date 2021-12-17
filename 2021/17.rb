data = "target area: x=209..238, y=-86..-59"
# data = "target area: x=20..30, y=-10..-5"

tx, ty = data.scan(/(-?\d+\.\.-?\d+)/).flatten.map { |target| Range.new(*target.split('..').map(&:to_i)) }

max_y = 0
hits = []

0.upto(tx.end).each do |origvx|
  (-100).upto(100).each do |origvy|
    next if origvx == 0 && origvy == 0
    vx, vy = origvx, origvy
    x, y = 0, 0
    current_max_y = 0

    until x > tx.end || y < ty.begin
      x += vx
      y += vy
      vx -= vx <=> 0
      vy -= 1
      current_max_y = [y, current_max_y].max

      if tx.cover?(x) && ty.cover?(y)
        hits << [origvx, origvy]
        max_y = [current_max_y, max_y].max

        break
      end
    end
  end
end

puts max_y
puts hits.uniq.count
