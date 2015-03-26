class DNANucleotide
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


class NucleotideHelper
  def print_frequencies(frequencies_struct)
    a = frequencies_struct[:A]
    c = frequencies_struct[:C]
    t = frequencies_struct[:T]
    g = frequencies_struct[:G]

    results = [a, c, g, t].map(&:to_s).join(" ")

    print results
  end
end
