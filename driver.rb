require_relative "robot"


file = ARGV.first

def start_robot(file)
  robot = Robot.new
  robot.read_commands(file)
  robot.reports.each do |report|
    puts report
  end
end

start_robot(file)
