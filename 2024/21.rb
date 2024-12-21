input = <<~INPUT
029A
980A
179A
456A
379A
INPUT

input = DATA.read

# +---+---+---+
# | 7 | 8 | 9 |
# +---+---+---+
# | 4 | 5 | 6 |
# +---+---+---+
# | 1 | 2 | 3 |
# +---+---+---+
#     | 0 | A |
#     +---+---+

$numpad = {
  "A" => {
    "A" => "A",
    "0" => "<A",
    "1" => "^<<A",
    "2" => "<^A",
    "3" => "^A",
    "4" => "^^<<A",
    "5" => "<^^A",
    "6" => "^^A",
    "7" => "^^^<<A",
    "8" => "<^^^A",
    "9" => "^^^A",
  },
  "0" => {
    "A" => ">A",
    "0" => "A",
    "1" => "^<A",
    "2" => "^A",
    "3" => "^>A",
    "4" => "^^<A",
    "5" => "^^A",
    "6" => ">^^A",
    "7" => "^^^<A",
    "8" => "^^^A",
    "9" => ">^^^A",
  },
  "1" => {
    "A" => ">>vA",
    "0" => ">vA",
    "1" => "A",
    "2" => ">A",
    "3" => ">>A",
    "4" => "^A",
    "5" => "^>A",
    "6" => "^>>A",
    "7" => "^^A",
    "8" => "^>A",
    "9" => "^>>A",
  },
  "2" => {
    "A" => "v>A",
    "0" => "vA",
    "1" => "<A",
    "2" => "A",
    "3" => ">A",
    "4" => "<^A",
    "5" => "^A",
    "6" => "^>A",
    "7" => "<^^A",
    "8" => "^^A",
    "9" => ">^^A",
  },
  "3" => {
    "A" => "vA",
    "0" => "<vA",
    "1" => "<<A",
    "2" => "<A",
    "3" => "A",
    "4" => "<<^A",
    "5" => "<^A",
    "6" => "^A",
    "7" => "<<^^A",
    "8" => "<^^A",
    "9" => "^^A",
  },
  "4" => {
    "A" => ">>vvA",
    "0" => ">vvA",
    "1" => "vA",
    "2" => "v>A",
    "3" => "v>>A",
    "4" => "A",
    "5" => ">A",
    "6" => ">>A",
    "7" => "^A",
    "8" => "^>A",
    "9" => "^>>A",
  },
  "5" => {
    "A" => "vv>A",
    "0" => "vvA",
    "1" => "<vA",
    "2" => "vA",
    "3" => "v>A",
    "4" => "<A",
    "5" => "A",
    "6" => ">A",
    "7" => "<^A",
    "8" => "^A",
    "9" => "^>A",
  },
  "6" => {
    "A" => "vvA",
    "0" => "<vvA",
    "1" => "<<vA",
    "2" => "<vA",
    "3" => "vA",
    "4" => "<<A",
    "5" => "<A",
    "6" => "A",
    "7" => "<<^A",
    "8" => "<^A",
    "9" => "^A",
  },
  "7" => {
    "A" => ">>vvvA",
    "0" => ">vvvA",
    "1" => "vvA",
    "2" => "vv>A",
    "3" => "vv>>A",
    "4" => "vA",
    "5" => "v>A",
    "6" => "v>>A",
    "7" => "A",
    "8" => ">A",
    "9" => ">>A",
  },
  "8" => {
    "A" => "vvv>A",
    "0" => "vvvA",
    "1" => "<vvA",
    "2" => "vvA",
    "3" => "vv>A",
    "4" => "<vA",
    "5" => "vA",
    "6" => "v>A",
    "7" => "<A",
    "8" => "A",
    "9" => ">A",
  },
  "9" => {
    "A" => "vvvA",
    "0" => "<vvvA",
    "1" => "<<vvA",
    "2" => "<vvA",
    "3" => "vvA",
    "4" => "<<vA",
    "5" => "<vA",
    "6" => "vA",
    "7" => "<<A",
    "8" => "<A",
    "9" => "A",
  },
}

#     +---+---+
#     | ^ | A |
# +---+---+---+
# | < | v | > |
# +---+---+---+

$keypad = {
  "A" => {
    "A" => "A",
    "<" => "v<<A",
    "^" => "<A",
    ">" => "vA",
    "v" => "<vA",
  },
  "<" => {
    "A" => ">>^A",
    "<" => "A",
    "^" => ">^A",
    ">" => ">>A",
    "v" => ">A",
  },
  "^" => {
    "A" => ">A",
    "<" => "v<A",
    "^" => "A",
    ">" => "v>A",
    "v" => "vA",
  },
  ">" => {
    "A" => "^A",
    "<" => "<<A",
    "^" => "<^A",
    ">" => "A",
    "v" => "<A",
  },
  "v" => {
    "A" => "^>A",
    "<" => "<A",
    "^" => "^A",
    ">" => ">A",
    "v" => "A",
  },
}

codes = input.split("\n")
$cache = {}

def solve(codes, robots)
  codes.sum do |code|
    # Move through the numpad
    current = "A"
    moves = code.chars.map do |char|
      $numpad[current][char].tap do
        current = char
      end
    end.join

    # Find minimum size and compute result
    code.scan(/\d+/)[0].to_i * min_size(moves, robots)
  end
end

def min_size(code, robots, depth = 0)
  # Return code size if we reached the last robot
  return code.size if depth == robots

  # CACHE!!
  $cache[[code, robots, depth]] ||= begin
    # We always start at "A"
    current = "A"

    # Move through the keypad and sum the result for each character
    code.chars.sum do |char|
      # Calculate the minimum result for the next robot
      min_size($keypad[current][char], robots, depth + 1).tap do
        # Set next character
        current = char
      end
    end
  end
end

puts "Part 1"
puts solve(codes, 2)

puts "Part 2"
puts solve(codes, 25)

__END__
480A
682A
140A
246A
938A
