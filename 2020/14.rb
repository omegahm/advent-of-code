input = File.readlines("day14.input")

mask = ""
mem = {}

input.each do |line|
  if /^mask/ === line
    _, mask = line.split(' = ')
  else
    # PART 1
    # m, val = line.split(' = ')
    # adr = m.scan(/\[(.*)\]/)[0][0].to_i
    # val = val.to_i.to_s(2).rjust(36, '0').chars.map.with_index do |c, idx|
    #   mask[idx] == 'X' ? c : mask[idx]
    # end.join
    # mem[adr] = val.to_i(2)

    # PART 2
    m, val = line.split(' = ')
    adr = m.scan(/\[(.*)\]/)[0][0].to_i
    chars = adr.to_s(2).rjust(36, '0').chars

    ['0', '1'].repeated_permutation(mask.count('X')).each do |perm|
      x = 0
      adr = chars.map.with_index do |c, idx|
        case mask[idx]
        when '0'
          c
        when '1'
          '1'
        when 'X'
          x += 1
          perm[x-1]
        end
      end.join
      mem[adr.to_i(2)] = val.to_i
    end
  end
end

puts mem.values.sum.inspect
