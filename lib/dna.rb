module DNA
  def self.to_h(dna)
    base = { 'A' => 0, 'C' => 0,
             'G' => 0, 'T' => 0 }
    dna.each_char
       .with_object(base) { |c,h| h[c] += 1 }
  end

  def self.to_rna(dna)
    dna.gsub('T','U')
  end
end
