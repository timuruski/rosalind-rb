#! /usr/bin/env ruby

require './lib/dna'

ARGF.each_line do |line|
  puts DNA.to_rna line.chomp
end
