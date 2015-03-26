class Nucleotide
  attr_accessor :sequence

  SEQUENCE_LIMIT = 1_000

  # A sequence is a string of bases, where a base is character
  # that is either A, C, T, or G.
  def initialize(sequence)
    @sequence = sequence

    if @sequence.length > SEQUENCE_LIMIT
      raise ValidationError
    end

    if !is_valid?(sequence)
      raise ValidationError
    end
  end

  def to_s
    sequence
  end

  def is_valid?(sequence)
    results = sequence.split("").all? do |base|
      base == "A" || base == "C" || base == "T" || base == "G" || base == "U"
    end
  end
end