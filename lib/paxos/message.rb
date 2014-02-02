module Paxos
  # Superclass for all paxos messages
  class Message
    # Create a paxos message
    #
    # @param process_id [Paxos::ProcessId] the message id
    def initialize(process_id)
      @src = src
    end
  end
end

require File.join __FILE__, '..', 'message/p1a_message'
require File.join __FILE__, '..', 'message/p1b_message'
require File.join __FILE__, '..', 'message/p2a_message'
require File.join __FILE__, '..', 'message/p2b_message'
require File.join __FILE__, '..', 'message/preempted_message'
require File.join __FILE__, '..', 'message/adopted_message'
require File.join __FILE__, '..', 'message/decision_message'
require File.join __FILE__, '..', 'message/request_message'
require File.join __FILE__, '..', 'message/propose_message'
