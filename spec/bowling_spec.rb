require 'bowling_game'

describe BowlingGame do
  let(:bowling_game) { BowlingGame.new score_string }
  subject { bowling_game.score }

  context "there have been no throws" do
    let(:score_string) { "--------------------"}
    it { should eql 0 }
  end

  context "when throwing 1 and 7" do
    let(:score_string) { "17------------------" }
    it { should eql 8 }
  end

  context "when throwing all ones" do
    let(:score_string) { "11111111111111111111" }
    it { should eql 20 }
  end

  describe "spare" do
    context "with last turn nine and spare" do
      let(:score_string) { "----9/5-------------" }
      it { should eql 20 }
    end

    context "with last turn 3 and spare" do
      let(:score_string) { "----5/7-------------" }
      it { should eql 24 }
    end

    context "last throw is a spare" do
      let(:score_string) { "------------------3/4" }
      it { should eql 18 }
    end
  end

  describe "strike" do
    context "one strike without luck" do
      let(:score_string) { "--X----------------"}
      it { should eql 10 }
    end

    context "one strike with bonus" do
      let(:score_string) { "--X12--------------"}
      it { should eql 16 }
    end

    context "two consecutive strikes" do
      let(:score_string) { "--XX--------------" }
      it { should eql 30 }
    end
  end

  describe "spare and strike combined" do
    let(:score_string) { "--4/X--------------" }
    it { should eql 30 }
  end
end