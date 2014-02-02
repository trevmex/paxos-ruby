module Paxos
  # The id of a process participating in paxos
  class ProcessId
    include Comparable

    # Create a new process id
    #
    # @param name [String] the name of the process
    def initialize(name)
      @name = name
    end

    # Compare this process id with another
    #
    # @param other [Paxos::ProcessId] the process id to compare to
    # @return <0 if this is less than other, 0 if equal, >0 otherwise
    def <=>(other)
      @name <=> other.instance_variable_get(:@name)
    end

    # String representation of a process name
    #
    # @return [String] the process name as a string
    def to_s
      "#{@name}"
    end
  end
end
