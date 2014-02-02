module Paxos
  # An adopted message
  class AdoptedMessage < Message
    # Creates an adopted message
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
