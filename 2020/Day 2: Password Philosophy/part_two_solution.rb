# frozen_string_literal: true

# Description/Explanation of Password class
class Password
  attr_reader :first_index, :second_index, :required_char, :chars

  def initialize(first_index:, second_index:, required_char:, chars:)
    @first_index = first_index
    @second_index = second_index
    @required_char = required_char
    @chars = chars
  end

  def valid?
    (chars[first_index] == required_char) ^ (chars[second_index] == required_char)
  end
end

passwords = File.read(File.join(File.dirname(__FILE__), './data.txt')).lines.map do |line|
  match = line.match(/(?<first_index>\d+)-(?<second_index>\d+) (?<required_char>\D): (?<chars>\D+)/)
  Password.new(
    first_index: match[:first_index].to_i - 1,
    second_index: match[:second_index].to_i - 1,
    required_char: match[:required_char],
    chars: match[:chars].tr("\n", ''),
  )
end

p passwords.select(&:valid?).size
