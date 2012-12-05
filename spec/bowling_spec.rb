require 'bowling_game'

describe BowlingGame do
  let(:bowling_game) { BowlingGame.new score_string }
  subject { bowling_game.score }

  context "there have been no throws" do
    let(:score_string) { "--------------------"}
    it { should eql 0 }
  end

  context "when throwing all ones" do
    let(:score_string) { "11111111111111111111" }
    it { should eql 20 }
  end

  context "All strikes" do
    let(:score_string) { "XXXXXXXXXXX" }
    it { should eql 300 }
  end

  describe "spare" do
    context "roling a 9, spare and 5" do
      let(:score_string) { "----9/5-------------" }
      it { should eql 20 }
    end

    context "roling a 5, spare and 8" do
      let(:score_string) { "----5/8-------------" }
      it { should eql 26 }
    end
  end

  describe "strike, spare combination" do
    let(:score_string) { "X4/----------------" }
    it { should eql 30 }
  end

  describe "full complex examples", "from http://bowling.about.com/od/rulesofthegame/a/bowlingscoring.htm" do
    before { pending('figure out how you can detect the bonus score') }
    let(:score_string) { "X7/729/XXX236/7/3" }
    it { should eql 168 }
  end
end