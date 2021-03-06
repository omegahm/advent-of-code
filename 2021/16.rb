data = "005532447836402684AC7AB3801A800021F0961146B1007A1147C89440294D005C12D2A7BC992D3F4E50C72CDF29EECFD0ACD5CC016962099194002CE31C5D3005F401296CAF4B656A46B2DE5588015C913D8653A3A001B9C3C93D7AC672F4FF78C136532E6E0007FCDFA975A3004B002E69EC4FD2D32CDF3FFDDAF01C91FCA7B41700263818025A00B48DEF3DFB89D26C3281A200F4C5AF57582527BC1890042DE00B4B324DBA4FAFCE473EF7CC0802B59DA28580212B3BD99A78C8004EC300761DC128EE40086C4F8E50F0C01882D0FE29900A01C01C2C96F38FCBB3E18C96F38FCBB3E1BCC57E2AA0154EDEC45096712A64A2520C6401A9E80213D98562653D98562612A06C0143CB03C529B5D9FD87CBA64F88CA439EC5BB299718023800D3CE7A935F9EA884F5EFAE9E10079125AF39E80212330F93EC7DAD7A9D5C4002A24A806A0062019B6600730173640575A0147C60070011FCA005000F7080385800CBEE006800A30C023520077A401840004BAC00D7A001FB31AAD10CC016923DA00686769E019DA780D0022394854167C2A56FB75200D33801F696D5B922F98B68B64E02460054CAE900949401BB80021D0562344E00042A16C6B8253000600B78020200E44386B068401E8391661C4E14B804D3B6B27CFE98E73BCF55B65762C402768803F09620419100661EC2A8CE0008741A83917CC024970D9E718DD341640259D80200008444D8F713C401D88310E2EC9F20F3330E059009118019A8803F12A0FC6E1006E3744183D27312200D4AC01693F5A131C93F5A131C970D6008867379CD3221289B13D402492EE377917CACEDB3695AD61C939C7C10082597E3740E857396499EA31980293F4FD206B40123CEE27CFB64D5E57B9ACC7F993D9495444001C998E66B50896B0B90050D34DF3295289128E73070E00A4E7A389224323005E801049351952694C000"
# data = "D2FE28"
# data = "38006F45291200"
# data = "EE00D40C823060"

# data = "8A004A801A8002F478" # => 16
# data = "620080001611562C8802118E34" # => 12
# data = "C0015000016115A2E0802F182340" # => 23
# data = "A0016C880162017C3686B18A3D4780" # => 31

# data = "9C005AC2F8F0" # => 5 > 15 => 0
# data = "9C0141080250320F1802104A08" # => 1 + 3 == 2 * 2 => 1

data = data.chars.flat_map do |char|
  char.to_i(16).to_s(2).rjust(4, '0').chars
end.map(&:to_i)

$sum_of_version_numbers = 0

def parse_packets(binary)
  return [] if binary.all?(&:zero?)
  version = binary.shift(3).join.to_i(2)
  $sum_of_version_numbers += version
  type_id = binary.shift(3).join.to_i(2)

  # puts "\nVersion: #{version}"
  # puts "Type ID: #{type_id}"
  packet_value = 0

  if type_id == 4
    # puts "  Literal (#{binary.count})"
    groups = []
    loop do
      groups << binary.shift(5)
      break if groups[-1][0] == 0
    end
    packet_value = groups.flat_map { |group| group[1..-1] }.join.to_i(2)
    # puts "  Groups: #{groups.size} Value: #{packet_value}"
  else
    # puts "  Operator"
    length_type_id = binary.shift
    # puts "  Length Type ID: #{length_type_id}"
    values = []

    case length_type_id
    when 0
      length = binary.shift(15).join.to_i(2)
      # puts "  Length: #{length} (out of #{binary.size})"
      new_data = binary.shift(length)
      until new_data.empty?
        new_data, value = parse_packets(new_data)
        values << value
      end
    when 1
      number_of_sub_packets = binary.shift(11).join.to_i(2)
      # puts "  Number of subpackets: #{number_of_sub_packets}"
      number_of_sub_packets.times do
        binary, value = parse_packets(binary)
        values << value
      end
    end

    packet_value = case type_id
      when 0 then values.reduce(:+)
      when 1 then values.reduce(:*)
      when 2 then values.min
      when 3 then values.max
      when 5, 6, 7
        operator = ['>', '<', '=='][type_id - 5]
        values.reduce(operator) ? 1 : 0
      end
  end

  [binary, packet_value]
end

_, value = parse_packets(data)
puts value
puts $sum_of_version_numbers
