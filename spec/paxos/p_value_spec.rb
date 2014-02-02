require 'spec_helper'

describe Paxos::PValue do
  ballot_number_process_id = Paxos::ProcessId.new(:foo)
  ballot_number = Paxos::BallotNumber.new(1, ballot_number_process_id)
  command_process_id = Paxos::ProcessId.new(:bar)
  command = Paxos::Command.new(command_process_id, 1, :baz)

  subject { Paxos::PValue.new(ballot_number, 1, command) }

  describe '#to_s' do
    it 'has a string representation' do
      expect(subject.to_s).to eq('PV(BN(1, foo), 1, Command(bar, 1, baz))')
    end
  end
end
