require './lib/cell'

class Board

  attr_reader :cells

  def initialize
    @cells = { "A1" => Cell.new("A1"),
               "A2" => Cell.new("A2"),
               "A3" => Cell.new("A3"),
               "A4" => Cell.new("A4"),
               "B1" => Cell.new("B1"),
               "B2" => Cell.new("B2"),
               "B3" => Cell.new("B3"),
               "B4" => Cell.new("B4"),
               "C1" => Cell.new("C1"),
               "C2" => Cell.new("C2"),
               "C3" => Cell.new("C3"),
               "C4" => Cell.new("C4"),
               "D1" => Cell.new("D1"),
               "D2" => Cell.new("D2"),
               "D3" => Cell.new("D3"),
               "D4" => Cell.new("D4")
 }
  end

  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate)
  end


  def coordinates_equal_length(ship, coordinates)
    ship.length == coordinates.length
  end

  def horizontal?(ship, coordinates)
    @cor = coordinates.map{|coordinate|coordinate[1]}
    integer = @cor.map(&:to_i)
    integer.each_cons(2).all?{|a,b| b == a + 1}
  end

  def vertical?(ship, coordinates)
      @cor = coordinates.map{|coordinate|coordinate[0]}
      integer = @cor.map(&:ord)
      integer.each_cons(2).all?{|a,b| b == a}
  end

  def cell_empty(ship, coordinates)

  end

  def consecutive_placement(ship,coordinates)
  return true if horizontal?(ship,coordinates) == true || vertical?(ship, coordinates) == true
    false
  end

  # def ship_placement?(ship, coordinates)
  #   @ship.coordinates_equal_length
  # end

  def valid_placement?(ship, coordinates)
    return true if consecutive_placement(ship, coordinates) && coordinates_equal_length(ship, coordinates) && cells.empty?
      false

    #
    #  if  consecutive_placement(ship, coordinates)
    #    true
    #   elsif coordinates_equal_length(ship, coordinates)
    #     true
    #   elsif  cell.empty?
    #    true
    #  else
    #    false
    # end
  end
end
