class DNA

  def initialize(sequence)
    @sequence = sequence
  end

  def to_s
    @sequence.dup
  end

  def bases
    base = { 'A' => 0, 'C' => 0,
             'G' => 0, 'T' => 0 }
    @sequence.each_char
       .with_object(base) { |c,h| h[c] += 1 }
  end

  def to_rna
    @sequence.tr('T','U')
  end

  def compliment
    @sequence.tr('ACGT', 'TGCA').reverse
  end

end
