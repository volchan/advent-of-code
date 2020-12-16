# frozen_string_literal: true

# Description/Explanation of Password class
class Password
  attr_reader :min, :max, :required_char, :chars

  def initialize(min:, max:, required_char:, chars:)
    @min = min
    @max = max
    @required_char = required_char
    @chars = chars
  end

  def valid?
    chars.count(required_char).between?(min, max)
  end
end

passwords = File.read(File.join(File.dirname(__FILE__), './data.txt')).lines.map do |line|
  match = line.match(/(?<min>\d+)-(?<max>\d+) (?<required_char>\D): (?<chars>\D+)/)
  Password.new(
    min: match[:min].to_i,
    max: match[:max].to_i,
    required_char: match[:required_char],
    chars: match[:chars].tr("\n", ''),
  )
end

p passwords.select(&:valid?).size
