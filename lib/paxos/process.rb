module Paxos
  # A Paxos process: Acceptor, Commander, Leader, Replica or Scout
  class Process < Thread
    # Create a paxos process
    #
    # @param env [Paxos::Env] the environment this proces belongs to
    # @me [Paxos::ProcessId] this process's process id
    def initialize(env, me)
      @env = env
      @inbox = Queue.new
      @me = me
      super
    end

    # The body of the process
    #
    # @throw [RuntimeError] this must be implemented by a subclass
    def body
      raise 'body must be implemented by a process subclass'
    end

    # Run the process
    def run
      body
      env.remove_proc me
    end

    # Get the next message from this process
    #
    # @return [Paxos::Message] the next message from the process
    def next_message
      inbox.pop
    end

    # Send a message to another process
    #
    # @param destination [Paxos::ProcessId] the process to send the message to
    # @param message [Paxos::Message] the message to send
    def send_message(destination, message)
      env.send_message destination, message
    end

    # Add a message to this process
    #
    # @param message [Paxos::Message] the message to add
    def deliver(message)
      inbox.push message
    end
  end
end

require File.join __FILE__, '..', 'process', 'acceptor'
require File.join __FILE__, '..', 'process', 'commander'
require File.join __FILE__, '..', 'process', 'leader'
require File.join __FILE__, '..', 'process', 'replica'
require File.join __FILE__, '..', 'process', 'scout'
