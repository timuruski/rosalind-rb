require 'contest'
require 'fasta'

class TestFasta < Test::Unit::TestCase
  setup do
    @subject = Fasta.new(<<-EOS)
>Rosalind_6404
CCTGCGGAAGATCGGCACTAGAATAGCCAGAACCGTTTCTCTGAGGCTTCCGGCCTTCCC
TCCCACTAATAATTCTGAGG
>Rosalind_5959
CCATCGGTAGCGCATCCTTAGTCCAATTAAGTCCCTATCCAGGCGCTCCGCCGAAGGTCT
ATATCCATTTGTCAGCAGACACGC
>Rosalind_0808
CCACCCTCGTGGTATGGCTAGGCATTCAGGAACCGGAGAACGCTTCAGACCAGCCCGGAC
TGGGAACCTGCGGGCAGTAGGTGGAAT
    EOS
  end

  test "it can iterate over each entry" do
    entries = []
    @subject.each do |entry|
      entries << entry
    end

    assert_equal 3, entries.length
  end

end
