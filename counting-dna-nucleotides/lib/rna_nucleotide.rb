require_relative 'custom_errors/validation_error'


class RNANucleotide < Nucleotide
  def initialize(sequence)
    if is_valid?(sequence)
      @sequence = sequence
    else
      raise ValidationError
    end
  end

  def is_valid?(sequence)
    results = sequence.split("").all? do |base|
      base == "A" || base == "C" || base == "T" || base == "G"
    end
  end
end