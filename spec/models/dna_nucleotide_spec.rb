require 'spec_helper'

describe DNANucleotide do
  let(:nucleotide) { build(:d_n_a_nucleotide) }

  it 'should inherit from Nucleotide' do
    expect(nucleotide.class.superclass).to be Nucleotide
  end

  it 'should have a BASES class variable that includes A, C, T, and G' do
    expect(DNANucleotide::BASES).to include('A', 'C', 'T', 'G')
  end

  describe '#compliment_by_base' do
    it 'should respond to `compliment_by_base`' do
      expect(nucleotide.respond_to?(:compliment_by_base)).to be true
    end

    it 'should return a InvalidBaseError if argument is not either A, C, T, or G' do
      expect{ nucleotide.compliment_by_base("O") }.to raise_error do |error|
        expect(error).to be_a InvalidBaseError
      end

      expect{ nucleotide.compliment_by_base("A") }.not_to raise_error
      expect{ nucleotide.compliment_by_base("C") }.not_to raise_error
      expect{ nucleotide.compliment_by_base("T") }.not_to raise_error
      expect{ nucleotide.compliment_by_base("G") }.not_to raise_error
    end

    it 'should return an InvalidLengthError if argument length is greater than 1'

    it 'should return A if given T' do
      compliment = nucleotide.compliment_by_base('T')

      expect(compliment).to eql 'A'
    end

    it 'should return T if given A' do
      compliment = nucleotide.compliment_by_base('A')

      expect(compliment).to eql 'T'
    end

    it 'should return C if given G' do
      compliment = nucleotide.compliment_by_base('G')

      expect(compliment).to eql 'C'
    end

    it 'should return G if given C' do
      compliment = nucleotide.compliment_by_base('C')

      expect(compliment).to eql 'G'
    end
  end

  describe '#compliment_by_sequence' do
    it 'should return the reversed, complimentary sequence' do
      s1 = "ACTTTG"
      d1 = DNANucleotide.new(s1)

      s2 = "TGGAACCCC"
      d2 = DNANucleotide.new(s2)

      c1 = d1.compliment_by_sequence(s1)
      c2 = d2.compliment_by_sequence(s2)

      expect(c1).to eql "CAAAGT"
      expect(c2).to eql "GGGGTTCCA"
    end

    it 'should respond to `compliment_by_sequence` message' do
      expect(nucleotide.respond_to?(:compliment_by_sequence)).to be true
    end

    it 'should receive `compliment_by_base` the same number of times as the sequence length' do
      # setup
      sequence = 'ACCTTTG'
      expect(sequence.length).to eql 7

      expect(nucleotide).to receive(:compliment_by_base).exactly(7).times  # verification

      nucleotide.compliment_by_sequence(sequence)  # exercise
    end

    it 'should return the reversed, compliment sequence' do
      n1 = Nucleotide.new('ACTTTG')
      n2 = Nucleotide.new('ATTCCGGA')
    end

    it 'should return InvalidSequenceError if sequence is not valid'
    it 'should return InvalidLengthError if sequence is greater than the limit'
  end

  describe '#frequencies' do
    it 'should return a hash containing the `bases` as keys and their number of occurrences within the `sequence` as values' do
      n1 = DNANucleotide.new('GATGGAACTTGACTACGTAAATT')
      n2 = DNANucleotide.new('ACCCTG')

      expect(n1.frequencies).to eql({A: 8, C: 3, T: 7, G: 5})
      expect(n2.frequencies).to eql({A: 1, C: 3, T: 1, G: 1})
    end
  end
end


describe NucleotideHelper do
  let(:helper) { NucleotideHelper.new }

  describe '#print_frequencies' do
    it 'should write `3 4 2 7` to STDOUT' do
      frequencies = {A: 3, C: 4, T: 7, G: 2}

      expect{ helper.print_frequencies(frequencies) }.to output("3 4 2 7").to_stdout
    end
  end
end
