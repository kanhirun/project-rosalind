require 'spec_helper'

describe RNANucleotide do
  let(:nucleotide) { RNANucleotide.new('GATGGAACTTGACTACGTAAATT') }

  it 'should inherit from Nucleotide' do
    expect(nucleotide.class.superclass).to be Nucleotide
  end

  describe '#transcribe' do
    it 'return the sequence with Ts replaced with Us' do
      s1 = nucleotide.transcribe('GATGGAACTTGACTACGTAAATT')
      s2 = nucleotide.transcribe('CATGGAACT')

      expect(s1).to eql 'GAUGGAACUUGACUACGUAAAUU'
      expect(s2).to eql 'CAUGGAACU'
    end
  end
end