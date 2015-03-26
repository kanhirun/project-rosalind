require 'spec_helper'

describe Nucleotide do
  let(:nucleotide) { Nucleotide.new('AGCTTTTCATTCTGAC') }

  describe '#sequence' do
    describe 'should return the argument passed' do
      it 'should return AGCTTTTCATTCTGAC as its sequence' do
        nucleotide = Nucleotide.new('AGCTTTTCATTCTGAC')

        expect(nucleotide.sequence).to eql('AGCTTTTCATTCTGAC')
      end

      it 'should return CATTCT as its sequence' do
        nucleotide = Nucleotide.new('CATTCT')

        expect(nucleotide.sequence).to eql('CATTCT')
      end
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
