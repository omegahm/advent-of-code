require 'set'

input = File.read('day6.input').split("\n\n").map { |line| line.gsub(/\n/, ' ') }

# PART 1
# puts (input.sum do |line|
#   line.split(' ').each_with_object(Set.new) do |answers, set|
#     answers.chars.each do |c|
#       set << c
#     end
#   end.size
# end)

# PART 2
puts (input.sum do |line|
  set = Set.new
  line.split(' ').each_with_index do |answers, idx|
    new_set = Set.new
    answers.chars.each do |c|
      new_set << c
    end

    if idx == 0
      set = new_set
    else
      set = set.intersection(new_set)
    end
  end

  set.size
end)
