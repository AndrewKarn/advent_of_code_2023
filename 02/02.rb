class GameRecord
  attr_reader :id, :blue, :red, :green

  def initialize(string)
    # split this ^ into our attributes
    id = string.split(':').first[-1]
    rounds = string.split(':').last.split(';')
    colors = rounds.map { |round| round.split(',').map(&:strip) }
    p colors
    @id = id
    @blue = colors.filter(&:blue?)
    # @red = cubes.filter(&:red?)
    # @green = cubes.filter(&:green?)
  end

  def num_blue
    @blue.length
  end

  def num_red
    @red.length
  end

  def num_green
    @green.length
  end
  # @param [String] arr
  def from_string(arr)
    # return a array of GameCube objects
    arr.map do |str|
      arr = str.split(' ')
      color = arr.last
      p color
      GameCube.new(color)
    end
  end
end

class GameCube
  attr_reader :color

  def initialize(color)
    raise 'Invalid color' unless %w[red green blue].include?(color)

    @color = color # red, green, blue
  end

  def blue?
    @color == 'blue'
  end

  def red?
    @color == 'red'
  end

  def green?
    @color == 'green'
  end

end


def possible_points(str)
  str.lines.map { |l| GameRecord.new(l) }
end

# puts possible_points(File.read('input.txt'))


p possible_points('Game 1: 1 red, 5 blue, 10 green; 5 green, 6 blue, 12 red; 4 red, 10 blue, 4 green')
