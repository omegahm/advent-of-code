# PART 1
# input = File.read('day4.input').split("\n\n").map { |line| line.gsub(/\n/, ' ') }
# must_haves = %w(byr iyr eyr hgt hcl ecl pid cid).sort

# puts (input.count do |passport|
#   hash = passport.split(' ').map { |p| p.split(':') }.to_h
#   (hash.keys << "cid").uniq.sort == must_haves
# end)

# PART 2
def check(passport)
  hash = passport.split(' ').map { |p| p.split(':') }.to_h
  return false unless hash['byr'] && (1920..2002).include?(hash['byr'].to_i)
  return false unless hash['iyr'] && (2010..2020).include?(hash['iyr'].to_i)
  return false unless hash['eyr'] && (2020..2030).include?(hash['eyr'].to_i)
  return false unless hash['hgt'] && ((hash['hgt'].end_with?('cm') && (150..193).include?(hash['hgt'].to_i)) || (hash['hgt'].end_with?('in') && (59..76).include?(hash['hgt'].to_i)))
  return false unless hash['hcl'] && /^#[0-9a-f]{6}$/ === hash['hcl']
  return false unless hash['ecl'] && %w(amb blu brn gry grn hzl oth).include?(hash['ecl'])
  return false unless hash['pid'] && /^\d{9}$/ === hash['pid']
  true
end

input = File.read('day4.input').split("\n\n").map { |line| line.gsub(/\n/, ' ') }
puts input.count { |passport| check(passport) }
