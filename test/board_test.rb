require './lib/board'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class BoardTest < Minitest::Test

  def test_it_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_cells_exists
    board = Board.new

    assert_equal board.cells, board.cells
  end

  def test_valid_coordinate?
    board = Board.new

    assert_equal true, board.valid_coordinate?("A1")
  end

  def test_coordinates_equal_length
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      assert_equal false, board.coordinates_equal_length(cruiser, ["A1", "A2"])
      assert_equal false, board.coordinates_equal_length(submarine, ["A2", "A3", "A4"])
    end

    def test_horizontal?
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      assert_equal false,  board.horizontal?(cruiser, ["A1", "A2", "A4"])
      assert_equal false,  board.horizontal?(submarine, ["A1", "C1"])
      assert_equal false,  board.horizontal?(cruiser, ["A3", "A2", "A1"])
    end

    def vertical?
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
      assert_equal false,  board.vertical?(submarine, ["C1", "B1"])
      assert_equal true,   board.vertical?(cruiser, ["A1", "B1", "C1"])
    end
end
