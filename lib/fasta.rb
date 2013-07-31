class Fasta
  include Enumerable

  def initialize(data)
    @data = data
  end

  def each
  end
end


if $0 == __FILE__
  class DNA
    def initialize(name)
      @name = name
      @string = ''
    end

    attr_reader :name

    def <<(value)
      @string << String(value)
    end
  end

  raw_data = DATA.read.each_line
  dna = nil

  dnas = raw_data.each_with_object [] do |line, dnas|
    next if line == "\n"

    if line[0] == '>'
      dnas << dna = DNA.new(line.chomp)
    else
      dna << line.chomp
    end

    dna
  end

  p dnas
end


__END__


>Rosalind_6404
CCTGCGGAAGATCGGCACTAGAATAGCCAGAACCGTTTCTCTGAGGCTTCCGGCCTTCCC
TCCCACTAATAATTCTGAGG
>Rosalind_5959
CCATCGGTAGCGCATCCTTAGTCCAATTAAGTCCCTATCCAGGCGCTCCGCCGAAGGTCT
ATATCCATTTGTCAGCAGACACGC
>Rosalind_0808
CCACCCTCGTGGTATGGCTAGGCATTCAGGAACCGGAGAACGCTTCAGACCAGCCCGGAC
TGGGAACCTGCGGGCAGTAGGTGGAAT
