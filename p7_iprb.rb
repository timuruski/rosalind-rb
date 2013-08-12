#! /usr/bin/env ruby

require './lib/phenotype'

data = ARGF.readline
k, m, n = data.split(' ', 3).map(&:to_i)

probability = Phenotype.new(k, m, n).dominant_expression
puts probability.round(5)
