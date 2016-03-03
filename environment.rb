module Environment
  LENGTH = WIDTH = 5

  CARDINAL = {
    "NORTH" => [0,1],
    "EAST" => [1,0],
    "SOUTH" => [0,-1],
    "WEST" => [-1,0]
  }


  def self.valid_move?(pin)
    pin[:x].to_i < LENGTH && pin[:y].to_i < WIDTH
  end

  def self.valid_cardinal?(cardinal)
    CARDINAL.keys.include?(cardinal[:cardinal])
  end

end
