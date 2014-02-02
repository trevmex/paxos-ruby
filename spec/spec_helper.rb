require 'simplecov'
require 'paxos'

SimpleCov.start
SimpleCov.minimum_coverage 100
SimpleCov.refuse_coverage_drop

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end
