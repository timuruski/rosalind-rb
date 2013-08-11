#! /usr/bin/env ruby

a, b = ARGF.readlines.map { |l| l.split('') }
hamm = a.zip(b)
  .reject { |a,b| a == b }
  .length

puts hamm
