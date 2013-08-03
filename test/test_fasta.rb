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

  test "assigns the correct name" do
    exp = %w[Rosalind_6404 Rosalind_5959 Rosalind_0808]
    names = @subject.map(&:name)
    assert_equal exp, names
  end

  test "entries have gc content" do
    entry = FastaEntry.new('test')
    entry << 'ACGT'
    assert_equal 0.50, entry.gc
  end

  test "finding entry with largest GC content" do
    largest = @subject.max_gc
    assert_equal 'Rosalind_0808', largest.name
  end

end
