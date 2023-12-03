require "digest"

input = "iwrupvqb"
number = 0
hex = ""

until hex.start_with?("00000")
  number += 1
  hex = Digest::MD5.hexdigest("#{input}#{number}")
end

puts "Part 1: #{number}"

number = 0
hex = ""

until hex.start_with?("000000")
  number += 1
  hex = Digest::MD5.hexdigest("#{input}#{number}")
end

puts "Part 2: #{number}"
