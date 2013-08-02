require 'forwardable'

class Fasta
  include Enumerable
  extend Forwardable

  def_delegator :@data, :each

  def initialize(data)
    @data = build(data)
  end

  def build(data)
    data.each_line.with_object([]) do |line, dnas|
      line = line.chomp
      if line[0] == '>'
        dnas << FastaEntry.new(line.tr('>', ''))
      else
        dnas.last << line
      end
    end
  end
end

class FastaEntry
  def initialize(name)
    @name = name
    @dna = ''
  end

  attr_reader :name

  def <<(value)
    @dna << String(value)
  end
end
