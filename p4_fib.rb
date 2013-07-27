#! /usr/bin/env ruby

require './lib/rabbits'

ARGF.each_line do |line|
  month, litter = line.split(' ').map(&:to_i)
  puts Rabbits.new(litter).pop(month)
end
