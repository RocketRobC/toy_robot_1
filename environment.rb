module Environment
  LENGTH = WIDTH = 5

  CARDINAL = {
    "NORTH" => [0,1],
    "EAST" => [1,0],
    "SOUTH" => [0,-1],
    "WEST" => [-1,0]
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
