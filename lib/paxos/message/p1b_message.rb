module Paxos
  # A Phase 1b message
  class P1bMessage < Message
    # Creates a phase 1b message
    #
    # @param src [Paxos::ProcessId] the message id
    # @param ballot_number [Paxos::BallotNumber] the ballot number
    # @param accepted [Set[Paxos::PValue]] accepts p values
    def initialize(src, ballot_number, accepted)
      super(src)
      @ballot_number = ballot_number
      @accepted = accepted
    end
  end
end
