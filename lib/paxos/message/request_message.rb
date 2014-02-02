module Paxos
  # A request message
  class RequestMessage < Message
    # Creates a decision message
    #
    # @param src [Paxos::ProcessId] the message id
    # @param command [Paxos::Command] the command containing the payload
    def initialize(src, command)
      super(src)
      @command = command
    end
  end
end
