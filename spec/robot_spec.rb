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
end
