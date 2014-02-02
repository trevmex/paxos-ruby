module Paxos
  # A Phase 2a message
  class P2aMessage < Message
    # Creates a phase 2a message
    #
    # @param src [Paxos::ProcessId] the message id
    # @param ballot_number [Paxos::BallotNumber] the ballot number
    # @param slot_number [Integer] the slot this command is in
    # @param command [Paxos::Command] the command containing the payload
    def initialize(src, ballot_number, slot_number, command)
      super(src)
      @ballot_number = ballot_number
      @slot_number = slot_number
      @command = command
    end
  end
end
