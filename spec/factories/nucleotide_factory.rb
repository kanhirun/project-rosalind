FactoryGirl.define do
  factory :nucleotide do
    initialize_with{ new('GATGGAACTTGACTACGTAAATT') }

    trait :invalid_bases do
      initialize_with{ new('12jorj12ojdwiosmc') }  # should only contain A, C, T, or G.
    end

    trait :invalid_length do
      initialize_with{ new('A' * 1001) }  # should be less than 1,000
    end
  end
end