module Paxos
  # A Phase 2b message
  class P2bMessage < Message
    # Creates a phase 2b message
    #
    # @param src [Paxos::ProcessId] the message id
    # @param ballot_number [Paxos::BallotNumber] the ballot number
    # @param slot_number [Integer] the slot this command is in
    def initialize(src, ballot_number, slot_number)
      super(src)
      @ballot_number = ballot_number
      @slot_number = slot_number
    end
  end
end
