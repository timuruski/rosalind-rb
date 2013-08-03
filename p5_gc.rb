#! /usr/bin/env ruby

require './lib/fasta'

fasta = Fasta.new(ARGF.read)
max = fasta.max_gc

puts max.name
puts '%0.6f' % (max.gc * 100)
