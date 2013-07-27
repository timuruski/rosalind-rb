#! /usr/bin/env ruby

require './lib/dna'

ARGF.each_line do |line|
  # 'A', 'C', 'G', 'T'
  bases = DNA.new(line.chomp).bases
  puts bases.values.join(' ')
end
