require 'spec_helper'

describe Paxos::ProcessId do
  subject { Paxos::ProcessId.new(:foo) }

  describe '#<=>' do
    it { should eq(subject) }
    it { should eq(Paxos::ProcessId.new(:foo)) }
    it { should_not eq(Paxos::ProcessId.new(:bar)) }
    it { should_not eq(nil) }
    it { should be < Paxos::ProcessId.new(:zaa) }
    it { should be <= Paxos::ProcessId.new(:foo) }
    it { should be >= Paxos::ProcessId.new(:bar) }
    it { should be > Paxos::ProcessId.new(:baz) }
  end

  describe '#to_s' do
    it 'turns into a string' do
      expect(subject.to_s).to eq('foo')
    end
  end
end
