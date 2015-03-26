require 'spec_helper'

describe RNANucleotide do
  let(:nucleotide) { RNANucleotide.new('GATGGAACTTGACTACGTAAATT') }

  it 'should inherit from Nucleotide' do
    expect(nucleotide.class.superclass).to be Nucleotide
  end

  describe 'validating sequence' do
    it 'should return ValidationError if sequence is invalid' do
      invalid_sequence = 'aoijfiadsljfsi'

      expect{ RNANucleotide.new(invalid_sequence) }.to raise_error('ValidationError')
    end

    it 'should return instance if sequence is valid' do
      valid_sequence = 'GATGGAACTTGACTACGTAAATT'
      nucleotide = RNANucleotide.new(valid_sequence)

      expect(nucleotide).to eql(nucleotide)
    end
  end
end