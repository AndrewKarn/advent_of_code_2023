# frozen_string_literal: true
def valid_games_sum(str, color_counts)
  valid_games_ids = []
  str.lines.map do |line|
    game_id = line.scan(/\d+/).first
    can_add = true
    line.scan(/\d+ \w+/).map do |round|
      count, color = round.split
      if color_counts[color.to_sym] < count.to_i
        can_add = false
        break
      end
    end
    valid_games_ids << game_id if can_add
  end
  valid_games_ids
end

input = File.read('input.txt')
p valid_games_sum(input, { red: 12, green: 13, blue: 14 }).sum(&:to_i) # 2720
