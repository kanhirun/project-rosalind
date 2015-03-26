require 'spec_helper'

describe Nucleotide do
  let(:nucleotide) { build(:nucleotide) }

  it 'should have a `sequence` attribute' do
    expect(nucleotide.sequence).to eql 'GATGGAACTTGACTACGTAAATT'
  end

  describe '#to_s' do
    it 'should return the value for the `sequence` attribute' do
      n1 = build(:nucleotide, sequence: 'AGAACT')
      n2 = build(:nucleotide, sequence: 'GATGGAACTTGACTACGTAAATT')

      expect(n1.to_s).to eql 'AGAACT'
      expect(n2.to_s).to eql 'GATGGAACTTGACTACGTAAATT'
    end
  end

  describe 'validations' do
    describe 'length limit' do
      it 'should return ValidationError if sequence > limit' do
        expect{ build(:nucleotide, :invalid_length) }.to raise_error('ValidationError')
      end
    end

    describe 'nucleotide bases' do
      it 'should return ValidationError if sequence contains invalid bases' do
        expect{ build(:nucleotide, :invalid_bases) }.to raise_error('ValidationError')
      end
    end
  end
end