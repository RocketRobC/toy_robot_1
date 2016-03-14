require "spec_helper"
require_relative "../driver"

describe Driver do

  before :each do
    @test_commands_1 = File.expand_path("../test_commands_1.txt", __FILE__)
    @driver = Driver.new(@test_commands_1)
  end

  it "is a driver" do
    expect(@driver).to be_a(Driver)
  end

  it "can read commands" do
    expect(@driver.robot_report).to eq(["2, 2, NORTH"])
  end

  

end
