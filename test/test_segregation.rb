require 'contest'
require 'segregation'

class TestSegregation < Test::Unit::TestCase

  describe "Factor.dominant_probability" do
    test "it handles matching homozygous factors" do
      pd, pr = Factor.expression('AA', 'AA')
      assert_equal pd, 1.00
      assert_equal pr, 0.00
    end

    test "it handles matching heterozygous factors" do
      pd, pr = Factor.expression('aa', 'aa')
      assert_equal pd, 0.00
      assert_equal pr, 1.00
    end

    test "it handles differing factors" do
      pd, pr = Factor.expression('Aa', 'aa')
      assert_equal pd, 0.50
      assert_equal pr, 0.50
    end

    test "it handles differing factors" do
      pd, pr = Factor.expression('aa', 'Aa')
      assert_equal pd, 0.50
      assert_equal pr, 0.50
    end

    test "it works with any letter" do
      pd, pr = Factor.expression('Xx', 'yy')
      assert_equal pd, 0.50
      assert_equal pr, 0.50
    end
  end

  describe "dominance" do
    test "it is dominant when a dominant allele is present" do
      assert Factor.new('Aa').dominant?
    end

    test "it is dominant when no recessive allele is present" do
      assert Factor.new('AA').dominant?
    end

    test "it is recessive when no dominant allele is present" do
      assert Factor.new('aa').recessive?
    end
  end

  describe "phenotype" do
    test "it returns the expected phenotype" do
      assert_equal Factor.new('Aa').phenotype, 'A'
      assert_equal Factor.new('AA').phenotype, 'A'
      assert_equal Factor.new('aa').phenotype, 'a'
    end
  end


end
