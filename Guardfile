guard :rspec do
  watch(%r{^spec/paxos/.+_spec\.rb$})
  watch(%r{^lib/paxos/(.+)\.rb$})     { |m| "spec/paxos/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end

