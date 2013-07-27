require 'contest'
require 'dna'

class TestDNA < Test::Unit::TestCase

  describe "#base" do
    test "returns a hash counting all the bases" do
      subject = DNA.new( 'GATGGAACTTGACTACGTAAATT')

      exp = { 'A' => 8, 'C' => 3,
              'G' => 5, 'T' => 7 }

      assert_equal subject.bases, exp
    end
  end

  describe "#rna" do
    test "it works" do
      subject = DNA.new( 'GATGGAACTTGACTACGTAAATT')

      exp = 'GAUGGAACUUGACUACGUAAAUU'

      assert_equal subject.to_rna, exp
    end
  end

  describe "#compliment" do
    test "it works" do
      subject = DNA.new( 'AAAACCCGGT')

      exp = 'ACCGGGTTTT'

      assert_equal subject.compliment, exp
    end
  end
end
