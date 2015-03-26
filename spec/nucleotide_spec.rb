require 'spec_helper'

describe Nucleotide do
  let(:nucleotide) { Nucleotide.new('GATGGAACTTGACTACGTAAATT') }

  it 'should have a `sequence` attribute' do
    expect(nucleotide.sequence).to eql 'GATGGAACTTGACTACGTAAATT'
  end

  describe '#to_s' do
    it 'should return the original sequence' do
      sequence_1 = 'GATGGAACTTGACTACGTAAATT'
      sequence_2 = 'GATGGAACTTGA'

      expect( Nucleotide.new(sequence_1).to_s ).to eql sequence_1
      expect( Nucleotide.new(sequence_2).to_s ).to eql sequence_2
    end
  end

  describe 'validations' do
    describe 'length' do
      it 'should return instance if sequence < 1000' do
        expect(nucleotide).to eql nucleotide
      end

      it 'should return ValidationError if sequence > 1000' do
        expect{ Nucleotide.new('A' * 1001) }.to raise_error('ValidationError')
      end
    end

    describe 'nucleotide bases' do
      it 'should return instance if sequence contains only valid bases' do
        valid_sequence = 'GATGGAACTTGACTACGTAAATT'  # A, G, T, C is allowed
        nucleotide = Nucleotide.new(valid_sequence)

        expect(nucleotide).to eql(nucleotide)
      end

      it 'should return ValidationError if sequence contains invalid bases' do
        invalid_sequence = 'aoijfiadsljfsi'

        expect{ Nucleotide.new(invalid_sequence) }.to raise_error('ValidationError')
      end
    end
  end
end