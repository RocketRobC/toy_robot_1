require_relative "environment"

class Robot

  attr_reader :reports

  def initialize
    @reports = []
  end

  def read_commands(file)
    File.read(file).split(/\n/).each do |line|
      interpret(line.strip)
    end
  end

  def interpret(line)
    if line.match(/(^PLACE)/)
      place_command(line)
    elsif line.match(/\A(MOVE)\z/)
      move
    elsif line.match(/\A(LEFT)\z/)
      turn("left")
    elsif line.match(/\A(RIGHT)\z/)
      turn("right")
    elsif line.match(/\A(REPORT)\z/)
      report
    elsif
      puts "Not a valid Robot command"
    end
  end


  def place_command(line)
    position = line.split(/\s|,/)
     if Environment.valid_move?(x: position[1], y: position[2]) && Environment.valid_cardinal?(cardinal: position[3])
       location(x: position[1], y: position[2], cardinal: position[3])
       @placed = true
     end
  end

  def placed?
    @placed
  end

  def location(pin)
    x = pin[:x] || @current_x
    y = pin[:y] || @current_y
    cardinal_direction = pin[:cardinal] || @current_cardinal
    current_pin(x: x, y: y, cardinal: cardinal_direction) if Environment.valid_move?(x: x, y: y)
  end

  def current_pin(current)
    @current_x = current[:x]
    @current_y = current[:y]
    @current_cardinal = current[:cardinal]
  end

  def cardinal
    Environment::CARDINAL[@current_cardinal]
  end

  def cardinal_directions
    Environment::CARDINAL.keys
  end

  def move
    if placed?
      x = @current_x.to_i + cardinal[0]
      y = @current_y.to_i + cardinal[1]
      location(x: x, y: y)
    end
  end

  def turn(direction)
    if placed?
      adjustment = direction == "left" ? -1 : 1
      turn = cardinal_directions[cardinal_directions.index(@current_cardinal) + adjustment]
      location(cardinal: turn)
    end
  end

  def report
    @reports << "#{@current_x}, #{@current_y}, #{@current_cardinal}" if placed?
    # puts "#{@current_x}, #{@current_y}, #{@current_cardinal}" if placed?
  end

end
