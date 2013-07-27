#! /usr/bin/env ruby

require './lib/dna'

ARGF.each_line do |line|
  puts DNA.new(line.chomp).compliment
end
