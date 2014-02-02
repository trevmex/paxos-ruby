module Paxos
  # A container for matching a command to a ballot
  class PValue
    # Create a PValue
    #
    # @param ballot_name [Paxos::BallotNumber] the ballot to associate
    # @param slot_number [Integer] the slot this p_value represents
    # @param command [Paxos::Command] the command to associate
    def initialize(ballot_name, slot_number, command)
      @ballot_number = ballot_name
      @slot_number = slot_number
      @command = command
    end

    # String representation of a p value
    #
    # @return [String] the p value name as a string
    def to_s
      "PV(#{@ballot_number}, #{@slot_number}, #{@command})"
    end
  end
end
