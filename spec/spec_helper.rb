# Require models here.
Dir.glob(File.expand_path('../../lib/*.rb', __FILE__)) do |model|
  require model
end

# Require factories here.
require 'factory_girl'
Dir.glob(File.expand_path('../factories/*.rb', __FILE__)) do |factory|
  require factory
end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
