module Paxos
  class BallotNumber
    include Comparable

    def initialize(round, leader_id)
      @round = round
      @leader_id = leader_id
    end

    def <=>(other)
      other_round = other.instance_variable_get(:@round)

      if other_round != @round
        @round - other_round
      else
        @leader_id <=> other.instance_variable_get(:@leader_id)
      end
    end

    def to_s
      "BN(#{@round}, #{@leader_id})"
    end
  end
end
