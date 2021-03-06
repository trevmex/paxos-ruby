require 'spec_helper'

describe Paxos::BallotNumber do
  subject { Paxos::BallotNumber.new(1, Paxos::ProcessId.new(:foo)) }

  describe '#<=>' do
    it { should eq(subject) }
    it { should eq(Paxos::BallotNumber.new(1, Paxos::ProcessId.new(:foo))) }
    it { should_not eq(Paxos::BallotNumber.new(1, Paxos::ProcessId.new(:bar))) }
    it { should_not eq(Paxos::BallotNumber.new(2, Paxos::ProcessId.new(:foo))) }
    it { should_not eq(nil) }
    it { should be < Paxos::BallotNumber.new(1, Paxos::ProcessId.new(:zaa)) }
    it { should be <= Paxos::BallotNumber.new(1, Paxos::ProcessId.new(:foo)) }
    it { should be >= Paxos::BallotNumber.new(1, Paxos::ProcessId.new(:bar)) }
    it { should be > Paxos::BallotNumber.new(1, Paxos::ProcessId.new(:baz)) }
    it { should be < Paxos::BallotNumber.new(2, Paxos::ProcessId.new(:foo)) }
    it { should be <= Paxos::BallotNumber.new(1, Paxos::ProcessId.new(:foo)) }
    it { should be >= Paxos::BallotNumber.new(0, Paxos::ProcessId.new(:foo)) }
    it { should be > Paxos::BallotNumber.new(-1, Paxos::ProcessId.new(:foo)) }
  end

  describe '#to_s' do
    it 'turns into a string' do
      expect(subject.to_s).to eq('BN(1, foo)')
    end
  end
end
