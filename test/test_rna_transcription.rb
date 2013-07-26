require 'contest'
require 'dna'

class SomeTest < Test::Unit::TestCase
  setup do
    @dna = 'GATGGAACTTGACTACGTAAATT'
    @rna = 'GAUGGAACUUGACUACGUAAAUU'
  end

  describe "#to_h" do
    test "it works" do
      exp = { 'A' => 8, 'C' => 3,
              'G' => 5, 'T' => 7 }
      h = DNA.to_h @dna

      assert_equal exp, h
    end
  end

  describe "#to_rna" do
    test "it works" do
      rna = DNA.to_rna @dna
      assert_equal @rna, rna
    end
  end
end
