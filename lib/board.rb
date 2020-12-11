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

  def all_numbers_alike(coordinates)
    coordinates.map {|coordinate| coordinate[1]}.uniq.length == 1
  end

  def all_letters_alike(coordinates)
    coordinates.map {|coordinate| coordinate[0]}.uniq.length == 1
  end

  def horizontal?(coordinates)
    @hor = coordinates.map{|coordinate|coordinate[1]}.map(&:to_i)
    @hor.each_cons(2).all?{|a,b| b == a + 1}
  end

  def vertical?(coordinates)
      @ver = coordinates.map{|coordinate|coordinate[0]}.map(&:ord)
      @ver.each_cons(2).all?{|a,b| b == a + 1}
  end

  def cell_empty(coordinates)
    coordinates.all? {|cell| @cells[cell].empty?}
  end

  def consecutive_placement(coordinates)
    if all_letters_alike(coordinates)
      horizontal?(coordinates)
    elsif all_numbers_alike(coordinates)
      vertical?(coordinates)
    else
      false
    end
  end

  def ship_coordinates_valid?(coordinates)
    coordinates.all? {|coordinate| valid_coordinate?(coordinate)}
  end
  # def ship_placement?(ship, coordinates)
  #   @ship.coordinates_equal_length
  # end

  def valid_placement?(ship, coordinates)
    cell_empty(coordinates)                    &&
    consecutive_placement(coordinates)         &&
    coordinates_equal_length(ship, coordinates)&&
    ship.length == coordinates.length          &&
    ship_coordinates_valid?(coordinates)
  end
end