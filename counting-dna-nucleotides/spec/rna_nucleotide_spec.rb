require 'spec_helper'

describe RNANucleotide do
  let(:nucleotide) { RNANucleotide.new('GATGGAACTTGACTACGTAAATT') }

  it 'should inherit from Nucleotide' do
    expect(nucleotide.class.superclass).to be Nucleotide
  end
end