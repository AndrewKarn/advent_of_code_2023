def decode(str)
  str.lines.map(&:normalize_word_string).sum { |l| (l[0] + l[1] || l[0]).to_i }
end

class String
  KEY_MAP = {
    'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3',
    'four' => '4', 'five' => '5', 'six' => '6', 'seven' => '7',
    'eight' => '8', 'nine' => '9'
  }.freeze

  def normalize_word_string
    new_str = ''
    [self, reverse].each do |s|
      new_str << s.process_substring
    end
    new_str
  end

  def process_substring
    each_char.with_index do |c, idx|
      return c if c.to_i.positive?

      sub_string = slice(0, idx + 1).strip
      match = find_match(sub_string)
      return KEY_MAP[match] if match
    end
  end

  private

  def find_match(sub_string)
    KEY_MAP.keys.find { |k| sub_string.include?(k) || sub_string.include?(k.reverse) }
  end
end

puts decode(File.read('input.txt')) # 55652
