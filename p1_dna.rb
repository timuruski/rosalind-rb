#! /usr/bin/env ruby

require './lib/dna'

ARGF.each_line do |line|
  # 'A', 'C', 'G', 'T'
  h = DNA.to_h line.chomp
  puts h.values.join(' ')
end
