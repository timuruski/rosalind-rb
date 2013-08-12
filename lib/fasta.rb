require 'forwardable'

class Fasta
  include Enumerable
  extend Forwardable

  def_delegator :@data, :each

  def initialize(data)
    @data = build(data)
  end

  def max_gc
    max { |a,b| a.gc <=> b.gc }
  end

  def build(data)
    data.each_line.with_object([]) do |line, dnas|
      line = line.chomp
      next if line.empty?

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

  def gc
    @dna.tr('AT', '').length.to_f / @dna.length.to_f
  end
end
