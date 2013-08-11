class Factor
  def self.expression(a,b)
    a = Factor.new(a)
    b = Factor.new(b)

    if a.dominant? && b.dominant?
      [1.0, 0.0]
    elsif a.dominant? || b.dominant?
      [0.5, 0.5]
    else
      [0.0, 1.0]
    end
  end

  def initialize(ab)
    @a, @b = ab.split('', 2)
  end

  def dominant?
    a_dominant? || b_dominant?
  end

  def recessive?
    !dominant?
  end

  def genotype
    "#@a#@b"
  end

  def phenotype
    dominant? ? @a : @b
  end

  protected

  def a_dominant?
    @a.upcase == @a
  end

  def b_dominant?
    @b.upcase == @b
  end
end
