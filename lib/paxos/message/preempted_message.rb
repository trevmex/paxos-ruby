module Paxos
  # A preempted message
  class PreemptedMessage < Message
    # Creates a preempted message
    #
    # @param src [Paxos::ProcessId] the message id
    # @param ballot_number [Paxos::BallotNumber] the ballot number
    def initialize(src, ballot_number)
      super(src)
      @ballot_number = ballot_number
    end
  end
end
