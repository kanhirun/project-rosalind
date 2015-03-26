FactoryGirl.define do
  factory :d_n_a_nucleotide do  # for the right camel-case name, this is its corresponding snake-case.
    initialize_with { new('GATGGAACTTGACTACGTAAATT') }
  end
end