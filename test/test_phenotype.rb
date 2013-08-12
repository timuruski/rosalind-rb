require 'contest'
require 'phenotype'

class TestPhenotype < Test::Unit::TestCase
  describe "Phenotype#dominant_expression" do
    test "calculating probability of dominant expression" do
      subject = Phenotype.new(2, 2, 2)
      probability = 0.78333
      assert_equal probability, subject.dominant_expression
    end
  end

  describe "Phenotype#mating_probability" do
    test "it can calculate of two types mating" do
      subject = Phenotype.new(2, 2, 2)
      probability = 8.0 / 15.0

      assert_equal probability, subject.mating_probability(:k, :k)
    end
  end

  describe "Phenotype#expression" do
    test "it returns the correct expressions" do
      assert_equal [1.0, 0.0], Phenotype.expression(:k,:k)
      assert_equal [0.5, 0.5], Phenotype.expression(:k,:m)
      assert_equal [0.5, 0.5], Phenotype.expression(:k,:n)
      assert_equal [0.0, 1.0], Phenotype.expression(:n,:n)
    end
  end

end
