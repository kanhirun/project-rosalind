require_relative 'custom_errors/validation_error'


class RNANucleotide < Nucleotide
  def initialize(sequence)
    _sequence = transcribe(sequence)

    super(_sequence)
  end

  def transcribe(sequence)
    @sequence = sequence.gsub(/T/, 'U')
  end
end