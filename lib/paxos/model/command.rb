module Paxos
  # A Paxos command used to wrap a data package
  class Command
    # Create a command wrapper
    #
    # @param client [Paxos::ProcessId] the process that makes the command
    # @param req_id [Integer] The id of this request
    # @param op [Object] The payload
    def initialize(client, req_id, op)
      @client = client
      @req_id = req_id
      @op = op
    end

    # Compare with another command
    #
    # @param other [Paxos::Command] the command to copare with
    # @return [Boolean] true if equal, false otherwise
    def ==(other)
      @client == get(other, 'client') && @req_id == get(other, 'req_id') && @op == get(other, 'op')
    end

    # String representation of a command
    #
    # @return [String] the command as a string
    def to_s
      "Command(#{@client}, #{@req_id}, #{@op})"
    end

    private

    def get(other, var)
      other.instance_variable_get("@#{var}".to_sym)
    end
  end
end
