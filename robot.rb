require_relative "environment"
require "byebug"

class Robot

  attr_reader :reports, :current_x, :current_y, :current_cardinal, :environment

  def initialize(environment)
    @reports = []
    @environment = environment
  end


  def place_command(position)
    if valid_placement?(position)
      set_location(position)
      @placed = true
    end
  end

  def valid_placement?(position)
    environment.valid_move?(position)
  end

  def placed?
    @placed
  end

  def set_location(pin)
    x = pin[:x] || current_x
    y = pin[:y] || current_y
    cardinal_direction = pin[:cardinal] || current_cardinal
    set_current_pin(x: x, y: y, cardinal: cardinal_direction) if environment.valid_move?(x: x, y: y)
  end

  def set_current_pin(current)
    @current_x = current[:x]
    @current_y = current[:y]
    @current_cardinal = current[:cardinal]
  end

  def move
    if placed?
      x = current_x + cardinal[0]
      y = current_y + cardinal[1]
      set_location(x: x, y: y)
    end
  end

  def turn(direction)
    if placed?
      adjustment = direction == "left" ? -1 : 1
      turn = cardinal_directions[(cardinal_directions.index(current_cardinal) + adjustment) % cardinal_count]
      set_location(cardinal: turn)
    end
  end

  def cardinal
    environment.direction_offsets(current_cardinal)
  end

  def cardinal_directions
    environment.directions
  end

  def cardinal_count
    cardinal_directions.count
  end

  def report
    @reports << "#{current_x}, #{current_y}, #{current_cardinal}" if placed?
  end

end
