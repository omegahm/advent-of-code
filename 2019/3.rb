fst, snd = File.readlines('day3.input')

space = []

current_x = 0
current_y = 0

fst.split(',').each do |op|
  dir = op[0]
  length = op[1..op.size-1].to_i

  case dir
  when 'R'
    (current_x..current_x+length).each do |x|
      space << { x: x, y: current_y }
    end
    current_x = current_x + length
  when 'L'
    (current_x-length..current_x).each do |x|
      space << { x: x, y: current_y }
    end
    current_x = current_x - length
  when 'U'
    (current_y-length..current_y).each do |y|
      space << { x: current_x, y: y }
    end
    current_y = current_y - length
  when 'D'
    (current_y..current_y+length).each do |y|
      space << { x: current_x, y: y }
    end
    current_y = current_y + length
  else
    raise "3-dimensional!"
  end
end

intersections = []

snd.split(',').each do |op|
  dir = op[0]
  length = op[1..op.size-1].to_i

  case dir
  when 'R'
    (current_x..current_x+length).each do |x|
      space << { x: x, y: current_y }
    end
    current_x = current_x + length
  when 'L'
    (current_x-length..current_x).each do |x|
      space << { x: x, y: current_y }
    end
    current_x = current_x - length
  when 'U'
    (current_y-length..current_y).each do |y|
      space << { x: current_x, y: y }
    end
    current_y = current_y - length
  when 'D'
    (current_y..current_y+length).each do |y|
      space << { x: current_x, y: y }
    end
    current_y = current_y + length
  else
    raise "3-dimensional!"
  end
end
