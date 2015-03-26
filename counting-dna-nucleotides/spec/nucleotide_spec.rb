require 'spec_helper'

describe Nucleotide do
  let(:nucleotide) { Nucleotide.new('AGCTTTTCATTCTGAC') }

  describe '#sequence' do
    it 'should return AGCTTTTCATTCTGAC as its sequence' do
      nucleotide = Nucleotide.new('AGCTTTTCATTCTGAC')

      expect(nucleotide.sequence).to eql('AGCTTTTCATTCTGAC')
    end
  end

  it 'should validate `sequence`'

  describe '#frequencies' do
    it 'should return a Hash with nucleotides as keys and their count as values' do
      results = nucleotide.frequencies()

      expect(results).to eql({A: 3, C: 4, T: 7, G: 2})
    end
  end
end


describe NucleotideHelper do
  let(:helper) { NucleotideHelper.new }

  describe '#print_frequencies' do
    it 'should write `3 4 2 7` to STDOUT' do
      frequencies = {A: 3, C: 4, T: 7, G: 2}

      # We want the following order, A, C, G, T
      expect{ helper.print_frequencies(frequencies) }.to output("3 4 2 7").to_stdout
    end
  end
end
