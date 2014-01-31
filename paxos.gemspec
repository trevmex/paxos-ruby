# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paxos/version'

Gem::Specification.new do |spec|
  spec.name          = 'paxos'
  spec.version       = Paxos::VERSION
  spec.authors       = ['Trevor Lalish-Menagh']
  spec.email         = ['trev@trevreport.org']
  spec.summary       = %q{A pure ruby implementation of the Paxos algorithm.}
  spec.description   = %q{This version of Paxos is based off of the paper "Paxos Made Moderately Complex" by Robert van Renesse (http://www.cs.cornell.edu/home/rvr/Paxos/).}
  spec.homepage      = 'https://github.com/trevmex/paxos-ruby'
  spec.license       = 'Apache License, Version 2.0'

  spec.files         = Dir['lib/**/*'] + ['LICENSE.txt', 'README.md']
  spec.test_files    = Dir['spec/**/*']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'simplecov'
end
