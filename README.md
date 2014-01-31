# Paxos ![](https://travis-ci.org/trevmex/paxos-ruby.png)

This is a pure Ruby implementation of the Paxos algorithm described in ["Paxos Made Moderately Complex" by Robert van Renesse](http://www.cs.cornell.edu/home/rvr/Paxos/).

## Installation

Add this line to your application's Gemfile:

    gem 'paxos'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paxos

## Usage

The code can be run using the command:

    $ ruby -e 'Paxos::Env.main'

## Contributing

1. Fork it ( http://github.com/<my-github-username>/paxos-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
