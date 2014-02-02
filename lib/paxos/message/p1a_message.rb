module Paxos
  # A Phase 1a message
  class P1aMessage < Message
    # Creates a phase 1a message
    #
    # @param src [Paxos::ProcessId] the message id
    # @param ballot_number [Paxos::BallotNumber] the ballot number
    def initialize(src, ballot_number)
      super(src)
      @ballot_number = ballot_number
    end
  end
end
