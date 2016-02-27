class Environment
  LENGTH = WIDTH = 5

  CARDINAL = {
    "NORTH" => [0,1],
    "EAST" => [1,0],
    "SOUTH" => [0,-1],
    "WEST" => [-1,0]
  }

  def initialize
    @x = @y = 0
    # @cardinal = cardinal
    # show
  end

  def show
    puts "x #{@x}"
    puts "y #{@y}"
    puts "cardinal #{@cardinal}"
  end

end
