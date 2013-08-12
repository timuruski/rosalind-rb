require 'contest'
require 'phenotype'

class TestPhenotype < Test::Unit::TestCase
  describe "Phenotype#dominant_expression" do
    test "calculating probability of dominant expression" do
      subject = Phenotype.new(2, 2, 2)
      probability = 0.78333
      assert_equal probability, subject.dominant_expression.round(5)
    end
  end

  describe "Phenotype#mating_probability" do
    test "it can calculate of two types mating" do
      subject = Phenotype.new(2, 2, 2)
      probability = 1.0 / 15.0

      assert_equal probability, subject.mating_probability(:k, :k)
    end
  end

  describe "Phenotype#expression_probability" do
    test "it combines the mating probability and expression" do
      subject = Phenotype.new(2, 2, 2)
      probability = 1.0 / 15.0

      assert_equal probability, subject.expression_probability(:k, :k)
    end
  end

  describe "Phenotype.expression" do
    test "it handles matching phenotypes" do
      assert_equal [1.00, 0.00], Phenotype.expression(:k,:k)
      assert_equal [0.75, 0.25], Phenotype.expression(:m,:m)
      assert_equal [0.00, 1.00], Phenotype.expression(:n,:n)
    end

    test "it handles mixed hetero-dominant" do
      assert_equal [1.00, 0.00], Phenotype.expression(:k,:m)
      assert_equal [1.00, 0.00], Phenotype.expression(:m,:k)
      assert_equal [0.50, 0.50], Phenotype.expression(:m,:n)
      assert_equal [0.50, 0.50], Phenotype.expression(:n,:m)
    end

  end

end
