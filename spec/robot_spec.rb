require "spec_helper"
require_relative "../robot"

describe Robot do

  context "when " do
    subject { described_class.new(Environment.new) }


    it "is a Robot" do
      expect(subject).to be_a(Robot)
    end


    context "understands valid commands" do
      it "ignores invalid place commands" do
        subject.place_command(x: 1, y: "r", cardinal: "CAT")
        expect(subject.reports).to eq([])
      end
      it "ignores invalid commands" do
        subject.place_command(x: "cow", y: "spoon", cardinal: "DOG")
        expect(subject.reports).to eq([])
      end

    end


    context "can understand movement" do
      before do
        subject.place_command(x: 1, y: 3, cardinal: "SOUTH")
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
  end
end
