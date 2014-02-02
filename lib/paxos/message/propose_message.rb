module Paxos
  # A propose message
  class ProposeMessage < Message
    # Creates a propose message
    #
    # @param src [Paxos::ProcessId] the message id
    # @param slot_number [Integer] the slot this command is in
    # @param command [Paxos::Command] the command containing the payload
    def initialize(src, slot_number, command)
      super(src)
      @slot_number = slot_number
      @command = command
    end
  end
end
