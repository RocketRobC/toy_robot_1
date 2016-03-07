module Environment
  LENGTH = WIDTH = 10

  CARDINAL = {
    "NORTH" => [0,1],
    "NORTH_EAST" => [1,1],
    "EAST" => [1,0],
    "SOUTH_EAST" => [1,-1],
    "SOUTH" => [0,-1],
    "SOUTH_WEST" => [-1,-1],
    "WEST" => [-1,0],
    "NORTH_WEST" => [-1,1],
  }


  def self.valid_move?(pin)
    x = pin[:x].to_i
    y = pin[:y].to_i
    x >= 0 && x < LENGTH && y >= 0 && y < WIDTH
  end

  def self.valid_cardinal?(cardinal)
    CARDINAL.keys.include?(cardinal[:cardinal])
  end

end
