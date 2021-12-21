players = [7 ,5]
# players = [4, 8]

scores = [0, 0]

rolls = 0
values = [1, 2, 3]

player = 0

until scores.max >= 1000
  # Add amount of rolls
  rolls += 3
  # Add score to player
  players[player] = ((players[player] + values.sum) - 1) % 10 + 1
  scores[player] += players[player]
  # Switch player
  player = (player + 1) % 2
  # Find new values
  values = values.map { |die| (die + 2) % 100 + 1 }
end

puts rolls * scores.min

# PART 2
players = [7 ,5]
# players = [4, 8]

# Heavily used cache
$cache = {}
def part2(pos1, score1, pos2, score2)
  # Use cache if we've seen this game before!
  $cache[[pos1, score1, pos2, score2]] ||= begin
    # How many wins in current branch
    p1, p2 = 0, 0

    # Loop over all die outcomes e.g. [1,1,1], [1,1,2] ...
    [1, 2, 3].repeated_permutation(3).each do |roll|
      # Only first player is playing
      # Add their roll to their position
      current_pos = ((pos1 + roll.sum) - 1) % 10 + 1
      # Add their position to their score
      current_score = score1 + current_pos

      if current_score >= 21
        # Did they win?
        win2, win1 = [0, 1]
      else
        # Flip the game. Result is amout of wins for player 2 first!
        win2, win1 = part2(pos2, score2, current_pos, current_score)
      end

      # Add their wins
      p1 += win1
      p2 += win2
    end

    # Return how many wins in the current branch
    [p1, p2]
  end
end

puts part2(players[0], 0, players[1], 0).max
