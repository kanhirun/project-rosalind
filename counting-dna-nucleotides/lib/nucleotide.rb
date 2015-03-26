class Nucleotide
  attr_accessor :sequence

  def initialize(sequence)
    # A sequence is a string of bases, where a base is character
    # that is either A, C, T, or G.
    @sequence = sequence
  end

  def frequencies
    results = { A: 0,
                C: 0,
                T: 0,
                G: 0 }

    sequence.each_char do |base|
      results[base.to_sym] += 1
    end

    return results
  end
end
