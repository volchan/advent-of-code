# frozen_string_literal: true

MAP = File.read(File.join(File.dirname(__FILE__), './data.txt')).lines.map(&:chomp)

def count_trees(right, down)
  current = 0
  total_trees = 0
  MAP.each_with_index do |line, idx|
    next if idx % down != 0 || idx.zero?

    current += right
    total_trees += 1 if line[current % line.size] == '#'
  end
  total_trees
end

# Part 1
puts count_trees(3, 1)

# Part 2
Slope = Struct.new(:right, :down)

slopes = [
  Slope.new(1, 1),
  Slope.new(3, 1),
  Slope.new(5, 1),
  Slope.new(7, 1),
  Slope.new(1, 2),
]

puts slopes.reduce(1) { |total, slope| total * count_trees(slope.right, slope.down) }
