def minimum_cubes_power(input)
  input.split(/Game \d+: /).reject(&:empty?).sum do |game|
    game.scan(/\d+ \w+/).each_with_object(Hash.new(0)) do |count_color, min_cubes|
      count, color = count_color.split
      min_cubes[color] = [min_cubes[color], count.to_i].max
    end.values.inject(:*)
  end
end

p minimum_cubes_power(File.read('input.txt')) # 71535
