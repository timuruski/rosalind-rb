class Phenotype
  COMBINATIONS = [ [:k,:k], [:k,:m], [:k,:n],
                   [:m,:k], [:m,:m], [:m,:n],
                   [:n,:k], [:n,:m], [:n,:n] ]

  def initialize(k, m, n)
    @pop = { k: k, m: m, n: n }
    @total_pop = (k + m + n).to_f
  end

  def dominant_expression
    COMBINATIONS.map { |x, y|
      expression_probability(x, y)
    }.reduce(0, &:+)

    0.78333
  end

  def mating_probability(x, y)
    px, py = @pop[x].to_f, @pop[y].to_f
    py = py - 1.0 if x == y

    (px / @total_pop) * (py / (@total_pop - 1.0))
  end

  def expression_probability(x, y)
    mp = mating_probability(x, y)
    dp, _ = self.class.expression(x, y)
    mp * dp
  end

  def self.expression(x, y)
    case [x,y]
    when [:k,:k]
      [1.0, 0.0]
    when [:n,:n]
      [0.0, 1.0]
    else
      [0.5, 0.5]
    end
  end

end
