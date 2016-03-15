require "spec_helper"
require_relative "../driver"

describe Driver do

  context "driver" do
    subject { described_class.new(File.expand_path("../test_commands_1.txt", __FILE__)) }

    it "is a driver" do
      expect(subject).to be_a(Driver)
    end

    it "can read commands" do
      expect(subject.robot_report).to eq(["2, 2, NORTH"])
    end

    # it "ignores commands before a valid place command" do
    #   subject.read_commands(File.expand_path("../test_commands_4.txt", __FILE__))
    #   expect(subject.robot_report).to eq(["1, 2, EAST"])
    # end
  end

end
