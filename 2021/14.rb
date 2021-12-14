data = <<HERE
SHHNCOPHONHFBVNKCFFC

HH -> K
PS -> P
BV -> H
HB -> H
CK -> F
FN -> B
PV -> S
KK -> F
OF -> C
SF -> B
KB -> S
HO -> O
NH -> N
ON -> V
VF -> K
VP -> K
PH -> K
FF -> V
OV -> N
BO -> K
PO -> S
CH -> N
FO -> V
FB -> H
FV -> N
FK -> S
VC -> V
CP -> K
CO -> K
SV -> N
PP -> B
BS -> P
VS -> C
HV -> H
NN -> F
NK -> C
PC -> V
HS -> S
FS -> S
OB -> S
VV -> N
VO -> P
KV -> F
SK -> O
BC -> P
BP -> F
NS -> P
SN -> S
NC -> N
FC -> V
CN -> S
OK -> B
SC -> N
HN -> B
HP -> B
KP -> B
CB -> K
KF -> C
OS -> B
BH -> O
PN -> K
VN -> O
KH -> F
BF -> H
HF -> K
HC -> P
NP -> H
KO -> K
CF -> H
BK -> O
OH -> P
SO -> F
BB -> F
VB -> K
SP -> O
SH -> O
PK -> O
HK -> P
CC -> V
NB -> O
NV -> F
OO -> F
VK -> V
FH -> H
SS -> C
NO -> P
CS -> H
BN -> V
FP -> N
OP -> N
PB -> P
OC -> O
SB -> V
VH -> O
KS -> B
PF -> N
KN -> H
NF -> N
CV -> K
KC -> B
HERE

# data = <<HERE
# NNCB

# CH -> B
# HH -> N
# CB -> H
# NH -> C
# HB -> C
# HC -> B
# HN -> C
# NN -> C
# BH -> H
# NC -> B
# NB -> B
# BN -> B
# BB -> N
# BC -> B
# CC -> N
# CN -> C
# HERE

def print_result(pairs, data)
  counts = pairs.each_with_object(Hash.new(0)) do |((a, _), value), hash|
    hash[a] += value
  end
  counts[data.lines[0].chomp[-1]] += 1
  puts counts.values.minmax.inject(:-).abs
end

pairs = data.lines[0].chomp.chars.each_cons(2).each_with_object(Hash.new(0)) do |pair, hash|
  hash[pair] += 1
end

code = data.lines.drop(2).map(&:chomp).each_with_object({}) do |c, hash|
  from, to = c.split(' -> ')
  hash[from.chars] = to
end

40.times do |i|
  pairs = pairs.each_with_object(Hash.new(0)) do |(key, value), hash|
    a, b = key
    hash[[a, code[key]]] += value
    hash[[code[key], b]] += value
  end
  print_result(pairs, data) if i+1 == 10
end

print_result(pairs, data)
