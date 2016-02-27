require_relative "robot"


file = ARGV.first

def start_robot(file)
  Robot.new(file)
  Environment.new
end

start_robot(file)
  
