require("rubygems")
require("json")

# Module to implement Paxos in Ruby
#
# http://en.wikipedia.org/wiki/Paxos_(computer_science)
module Paxos
  # Immutable class to represent a proposal.
  class Proposal
    def initialize(id)
      begin
        @id = Integer(id)
      rescue ArgumentError
        raise ArgumentError, "id must be an integer", caller
      end
    end

    def next
      self.class.new(@id + 1)
    end

    def serialize(msg = nil)
      serializable_data = {
        "class" => "Paxos::Proposal",
        "id"    => @id.to_s
      }
      serializable_data["msg"] = msg unless msg.nil? || msg.empty?
      serializable_data.to_json
    end
  end

  # Class to represent a pool of acceptors.
  #
  # Used to find a quorum.
  class AcceptorPool
    def raise_arrgument_error
      raise ArgumentError, "acceptors must be an array of 0 or more Paxos::Role::Acceptor objects", caller
    end
    
    def initialize(acceptors = [])
      @acceptors = []
      self.raise_argument_error unless acceptors.respond_to?('each')
      acceptors.each do |a|
        self.add_acceptor(a)
      end
    end

    def add_acceptor(a)
        self.raise_argument_error unless a.kind_of?(Paxos::Role::Acceptor)
        @acceptors.push a
    end

    def random_quorum
      @acceptors.sort_by{ rand }.slice(0...number_of_acceptors_in_a_quorum)
    end

    private

    def number_of_acceptors_in_a_quorum
      @acceptors.length / 2 + 1
    end
  end

  # Module to capture all the roles
  #
  # Paxos describes the actions of the processes by their roles in the protocol:
  # client, acceptor, proposer, learner, and leader
  # In typical implementations, a single processor may play one or more roles at the same time.
  # This does not affect the correctness of the protocol,
  # it is usual to coalesce roles to improve the latency and/or number of messages in the protocol.
  module Role
    # Class to represent a client
    #
    # The Client issues a request to the distributed system, and waits for a response.
    # For instance, a write request on a file in a distributed file server.
    class Client
    end

    # Class to represent an acceptor
    #
    # The Acceptors act as the fault-tolerant "memory" of the protocol.
    # Acceptors are collected into groups called Quorums.
    # Any message sent to an Acceptor must be sent to a Quorum of Acceptors.
    # Any message received from an Acceptor is ignored unless a copy is received from each Acceptor in a Quorum.
    class Acceptor
      def initialize(address, port)
        @address = address
        @port = port
      end
    end

    # Class to represent a proposer
    #
    # A Proposer advocates a client request, attempting to convince the Acceptors to agree on it,
    # and acting as a coordinator to move the protocol forward when conflicts occur.
    class Proposer
      def initialize(acceptor_pool = Paxos::AcceptorPool.new) 
        raise ArgumentError, "acceptor_pool must be a Paxos::AcceptorPool object", caller unless a.kind_of?(Paxos::AcceptorPool)
        @acceptor_pool = acceptor_pool
        @higest_known_proposal = Paxos::Proposal.new(0)
      end

      protected

      def next_proposal
        @highest_known_proposal.next
      end
    end

    # Class to represent a learner
    #
    # Learners act as the replication factor for the protocol.
    # Once a Client request has been agreed on by the Acceptors, the Learner may take action
    # (i.e.: execute the request and send a response to the client).
    # To improve availability of processing, additional Learners can be added.
    class Learner
    end

    # Class to represent the leader
    #
    # Paxos requires a distinguished Proposer (called the leader) to make progress.
    # Many processes may believe they are leaders, but the protocol only guarantees progress if one of them is eventually chosen.
    # If two processes believe they are leaders, they may stall the protocol by continuously proposing conflicting updates.
    # However, the safety properties are still preserved on that case.
    class Leader < Proposer
      # Phase 1a: Prepare
      def prepare
        @acceptor_pool.random_quorum.each do |acceptor|
          next_proposal.serailize("Prepare")
        end
      end
    end
  end
end
