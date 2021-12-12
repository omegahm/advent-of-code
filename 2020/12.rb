input = File.readlines('day12.input').map(&:chomp)

facing = 0
# PART 1
x, y = 0, 0
# PART 2
wx, wy = 10, 1

input.each do |instr|
  op = instr[0]
  val = instr[1..].to_i

  case op
  when 'N'
    wy += val
  when 'S'
    wy -= val
  when 'E'
    wx += val
  when 'W'
    wx -= val
  when 'L'
    facing += val
    facing %= 360

    case val
    when 90
      wx, wy = -wy, wx
    when 180
      wx, wy = -wx, -wy
    when 270
      wx, wy = wy, -wx
    end
  when 'R'
    facing -= val
    facing %= 360
    case val
    when 90
      wx, wy = wy, -wx
    when 180
      wx, wy = -wx, -wy
    when 270
      wx, wy = -wy, wx
    end
  when 'F'
    val.times do
      x += wx
      y += wy
    end
  end

  puts [instr, x, y, wx, wy].inspect
end

puts x.abs + y.abs