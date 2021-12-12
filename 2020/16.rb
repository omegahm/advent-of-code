input = File.readlines('day16.input')

rules = []
your_ticket = nil
nearby_tickets = []

type = :rules
input.each do |line|
  if line == "\n"
    type = type == :rules ? :your_ticket : :nearby_tickets
    next
  end

  case type
  when :rules
    rules << [
      line.chomp.split(': ')[0],
      line.chomp.split(': ')[1].split(' or ').map { |range| a, b = range.split('-').map(&:to_i); (a..b) }
    ]
  when :your_ticket
    next if /your ticket/ === line
    your_ticket = line.chomp.split(',').map(&:to_i)
  when :nearby_tickets
    next if /nearby tickets/ === line
    nearby_tickets << line.chomp.split(',').map(&:to_i)
  end
end

# PART 1
result = nearby_tickets.flatten.select do |value|
  rules.map(&:last).flatten.none? { |rule| rule.include?(value) }
end

puts result.sum

# PART 2
valid_tickets = nearby_tickets.reject do |ticket|
  ticket.any? do |value|
    rules.map(&:last).flatten.none? { |rule| rule.include?(value) }
  end
end

departure_fields = []
fields = (0..your_ticket.size-1).to_a

until fields.empty?
  fields_size = fields.size

  selected_rule = rules.select do |rule_pair|
    selected_fields = fields.select do |field|
      values = valid_tickets.map { |nf| nf[field] }
      values.all? do |value|
        rule_pair.last.any? { |rule| rule.include?(value) }
      end
    end

    if selected_fields.size == 1
      departure_fields << selected_fields if /departure/ === rule_pair[0]
      fields.reject! { |f| f == selected_fields[0] }
      rules.reject! { |rule| rule.first == rule_pair.first }
      true
    else
      false
    end
  end
end

puts departure_fields.flatten.map { |f| your_ticket[f] }.reduce(:*)
