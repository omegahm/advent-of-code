input = "abc"
input = "reyedfim"

require 'digest'

index = 0
password1 = []
password2 = [nil, nil, nil, nil, nil, nil, nil, nil]

until password1.size == 8 && password2.all?
  hash = Digest::MD5.hexdigest("#{input}#{index}")

  if hash.start_with?("00000")
    password1 << hash[5] if password1.size < 8
    password2[hash[5].to_i] ||= hash[6] if /[0-7]/ === hash[5]
  end

  index += 1
end

puts "Part 1", password1.join
puts "Part 2", password2.join
