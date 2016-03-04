require "spec_helper"
require_relative "../robot"

describe Robot do
  it "is a Robot" do
    expect(subject).to be_a(Robot)
  end

  it "can read commands" do
    subject.read_commands(File.expand_path("../test_commands_1.txt", __FILE__))
    expect(subject.reports).to eq(["2, 2, NORTH"])
  end


  context "understands valid commands" do
    it "ignores invalid place commands" do
      subject.place_command("PLACE 8,9,DOG")
      expect(subject.reports).to eq([])
    end
    it "ignores commands before a valid place command" do
      subject.read_commands(File.expand_path("../test_commands_4.txt", __FILE__))
      expect(subject.reports).to eq(["1, 2, EAST"])
    end
    it "ignores invalid commands" do
      subject.place_command("COW, SPOON, CAT")
      expect(subject.reports).to eq([])
    end

  end


  context "can understand movement" do
    before do
      subject.place_command("PLACE 1,3,SOUTH")
    end
    it "move forward 1 space" do
      subject.move
      expect(subject.report).to eq(["1, 2, SOUTH"])
    end
    it "turns left" do
      subject.turn("left")
      expect(subject.report).to eq(["1, 3, EAST"])
    end
    it "turns right" do
      subject.turn("right")
      expect(subject.report).to eq(["1, 3, WEST"])
    end
    it "will ignore commands that would move out of bounds" do
      subject.move
      subject.move
      subject.move
      subject.move
      expect(subject.report).to eq(["1, 0, SOUTH"])
    end
  end

  it "won't move out of bounds" do
    subject.read_commands(File.expand_path("../test_commands_5.txt", __FILE__))
    expect(subject.reports).to eq(["1, 0, SOUTH"])
  end

end
