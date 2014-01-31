module Paxos
  class ProcessId
    include Comparable

    def initialize(name)
      @name = name
    end

    def <=>(other)
      @name <=> other.instance_variable_get(:@name)
    end

    def to_s
      "#{@name}"
    end
  end
end
