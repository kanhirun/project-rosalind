require_relative 'nucleotide'
require_relative 'custom_errors/invalid_base_error'


class DNANucleotide < Nucleotide
  BASES = ['A', 'C', 'T', 'G']
  COMPLIMENT_BASES = { A: 'T', T: 'A', G: 'C', C: 'G' }

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

  def compliment_by_sequence(sequence)
    sequence.each_char.map do |base|
      compliment_by_base(base)
    end.join.reverse
  end

  def compliment_by_base(base)
    raise InvalidBaseError if !BASES.include?(base)

    return COMPLIMENT_BASES[base.to_sym]
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
