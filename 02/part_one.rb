# frozen_string_literal: true

def valid_games_sum(str, color_counts)
  str.lines.map do |line|
    game_id = line[/\d+/]
    valid = line.scan(/\d+ \w+/).all? { |round| count, color = round.split; count.to_i <= color_counts[color.to_sym] }
    valid ? game_id.to_i : 0
  end.sum
end

input = File.read('input.txt')
p valid_games_sum(input, { red: 12, green: 13, blue: 14 }) # 2720
