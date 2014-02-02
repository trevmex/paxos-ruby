require 'spec_helper'

describe Paxos::Command do
  subject { Paxos::Command.new(Paxos::ProcessId.new(:foo), 1, 'fake object') }

  describe '#==' do
    it { should eq(Paxos::Command.new(Paxos::ProcessId.new(:foo), 1, 'fake object')) }
    it { should_not eq(Paxos::Command.new(Paxos::ProcessId.new(:bar), 1, 'fake object')) }
    it { should_not eq(Paxos::Command.new(Paxos::ProcessId.new(:foo), 2, 'fake object')) }
    it { should_not eq(Paxos::Command.new(Paxos::ProcessId.new(:foo), 1, 'fake object two')) }
  end

  describe '#to_s' do
    it 'has a string representation' do
      expect(subject.to_s).to eq('Command(foo, 1, fake object)')
    end
  end
end
