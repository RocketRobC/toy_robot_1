class Environment
  LENGTH = 5
  WIDTH = 5

  CARDINAL = {
    "NORTH" => [0,1],
    "EAST" => [1,0],
    "SOUTH" => [0,-1],
    "WEST" => [-1,0],
  }

  def directions
    CARDINAL.keys
  end

  def direction_offsets(current_cardinal)
    CARDINAL.fetch(current_cardinal)
  end

  def valid_move?(pin)
     valid_length(pin[:y]) && valid_width(pin[:x])
  end

  def valid_length(y)
    (0..LENGTH).include? y
  end

  def valid_width(x)
    (0..WIDTH).include? x
  end

end
