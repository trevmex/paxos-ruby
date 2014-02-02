module Paxos
  # A unique identifier for a ballot in a synod
  class BallotNumber
    include Comparable

    # Creates a ballot number
    #
    # @param round [Integer] the round this ballot number represents
    # @param leader_id [Paxos::ProcessId] The process that is the leader during this ballot vote
    def initialize(round, leader_id)
      @round = round
      @leader_id = leader_id
    end

    # Compare this ballot number with another
    #
    # @param other [Paxos::BalotNumber] the ballot to compare to
    # @return [Integer] <0 if this is less that other, 0 if equal, >0 otherwise
    def <=>(other)
      other_round = other.instance_variable_get(:@round)

      if other_round != @round
        @round - other_round
      else
        @leader_id <=> other.instance_variable_get(:@leader_id)
      end
    end

    # String representation of a ballot number
    #
    # @return [String] the ballot number as a string
    def to_s
      "BN(#{@round}, #{@leader_id})"
    end
  end
end
