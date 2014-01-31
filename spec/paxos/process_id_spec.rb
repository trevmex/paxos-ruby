require 'spec_helper'
require 'paxos/process_id'

describe Paxos::ProcessId do
  subject { Paxos::ProcessId.new(:foo) }

  describe '#<=>' do
    it { should eq(subject) }
    it { should eq(Paxos::ProcessId.new(:foo)) }
    it { should_not eq(Paxos::ProcessId.new(:bar)) }
    it { should_not eq(nil) }
  end

  describe '#to_s' do
    it 'turns into a string' do
      subject.to_s.should eq("foo")
    end
  end
end
