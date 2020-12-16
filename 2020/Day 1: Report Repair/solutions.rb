# frozen_string_literal: true

require('YAML')

data = YAML.safe_load(File.open(File.join(File.dirname(__FILE__), './data.yml')))

[2, 3].each do |n|
  p data.combination(n).find { |nums| nums.sum == 2020 }.inject(&:*)
end
