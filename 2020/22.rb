# PART 1
player1, player2 = File.read('day22.input').split("\n\n").map { |arr| arr.split(' ')[2..].map(&:to_i) }

until player1.empty? || player2.empty?
  card1, card2 = player1.shift, player2.shift

  if card1 > card2
    player1.push(card1)
    player1.push(card2)
  else
    player2.push(card2)
    player2.push(card1)
  end
end

winner = [player1, player2].reject(&:empty?)[0]
result = winner.reverse.zip((1..winner.size)).reduce(0) do |acc, (value, idx)|
  acc += value * idx
end

puts result

# PART 2
require 'set'
player1, player2 = File.read('day22.input').split("\n\n").map { |arr| arr.split(' ')[2..].map(&:to_i) }

$seen_decks = Set.new

def combat(player1, player2)
  player1, player2 = player1.dup, player2.dup

  until player1.empty? || player2.empty?
    return :player1 if $seen_decks.include?([player1, player2])

    $seen_decks << [player1, player2]
    card1, card2 = player1.shift, player2.shift

    winner = if card1 <= player1.size && card2 <= player2.size
      combat(player1.take(card1), player2.take(card2))
    else
      card1 > card2 ? :player1 : :player2
    end

    case winner
    when :player1
      player1.push(card1)
      player1.push(card2)
    when :player2
      player2.push(card2)
      player2.push(card1)
    end
  end

  player1.empty? ? :player2 : :player1
end

until player1.empty? || player2.empty?
  $seen_decks << [player1, player2]

  card1, card2 = player1.shift, player2.shift

  winner = if card1 <= player1.size && card2 <= player2.size
    combat(player1.take(card1), player2.take(card2))
  else
    card1 > card2 ? :player1 : :player2
  end

  case winner
  when :player1
    player1.push(card1)
    player1.push(card2)
  when :player2
    player2.push(card2)
    player2.push(card1)
  end
end

winner = [player1, player2].reject(&:empty?)[0]
result = winner.reverse.zip((1..winner.size)).reduce(0) do |acc, (value, idx)|
  acc += value * idx
end

puts result
