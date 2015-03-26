require 'spec_helper'

describe RNANucleotide do
  let(:nucleotide) { RNANucleotide.new('GATGGAACTTGACTACGTAAATT') }

  it 'should inherit from Nucleotide' do
    expect(nucleotide.class.superclass).to be Nucleotide
  end

  describe '#transcribe' do
    it 'return the sequence with Ts replaced with Us' do
      results_1 = nucleotide.transcribe('GATGGAACTTGACTACGTAAATT')
      results_2 = nucleotide.transcribe('CATGGAACT')

      expect(results_1).to eql 'GAUGGAACUUGACUACGUAAAUU'
      expect(results_2).to eql 'CAUGGAACU'
    end
  end
end