require_relative "robot"
require_relative "environment"

class Driver

  attr_reader :robot, :environment

  def initialize(file)
    @environment = Environment.new
    @robot = Robot.new(environment)
    read_commands(file)
    robot_report
  end

  def read_commands(file)
    File.read(file).split(/\n/).each do |line|
      interpret(line.strip)
    end
  end

  def interpret(line)
    if line.match(/\APLACE (\d+),(\d+),(#{environment.directions.join("|")})/)
      robot.place_command(x: $1.to_i, y: $2.to_i, cardinal: $3)
    elsif line.match(/\A(MOVE)\z/)
      robot.move
    elsif line.match(/\A(LEFT)\z/)
      robot.turn("left")
    elsif line.match(/\A(RIGHT)\z/)
      robot.turn("right")
    elsif line.match(/\A(REPORT)\z/)
      robot.report
    elsif
      puts "Not a valid Robot command"
    end
  end

  def robot_report
    robot.reports.each do |report|
      puts report
    end
  end

end
