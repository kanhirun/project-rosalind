# Require models here.
require 'factory_girl'
require_relative '../lib/nucleotide'
require_relative '../lib/dna_nucleotide'
require_relative '../lib/rna_nucleotide'


RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    # Ensures that all factories are valid before testing begins.
    FactoryGirl.lint
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
