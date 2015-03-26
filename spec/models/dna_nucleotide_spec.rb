require 'spec_helper'

describe DNANucleotide do
  let(:nucleotide) { build(:d_n_a_nucleotide) }

  it 'should inherit from Nucleotide' do
    expect(nucleotide.class.superclass).to be Nucleotide
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
